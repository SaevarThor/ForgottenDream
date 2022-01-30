using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;
using System;

[RequireComponent(typeof(CharacterController))]
public class PlayerController : MonoBehaviour 
{
	public float WalkSpeed = 6f;
    public float RunSpeed = 11f; 
	public float JumpSpeed = 8f;
	public float Gravity = 20f;
	public float SlideSpeed = 12f;
	public float AntiBumperFactor = .75f; 
	public int AntiBunnyHopFactor = 1; 
	public bool LimitDiagonalSpeed = true; 
	public bool ToggleRun; 
	public bool SlideWhenOverSlopeLimit; 
	public bool SlideOnTaggedObjects; 
	public PlayerAttack Attack; 
	public Interaction Interaction; 

	public bool CantMove; 
	
	[SerializeField] private bool _airControl; 

	//Private vars
	private Vector3 _moveDirection = Vector3.zero; 
	private Vector3 _contactPoint; 
	private bool _grounded; 
	private float _speed; 
	private float _slideLimit; 
	private float _rayDistance; 
	private int _jumpTimer; 
	private Transform _myTransform; 
	private CharacterController _controller; 
	private RaycastHit _hit; 
	
	public PhotonView View; 

	private PlayerActionControler _playerActionControler;
	[SerializeField] private GameObject _camObject; 
	[SerializeField] private Animator _anim; 
	[SerializeField] private SkinnedMeshRenderer[] renders; 

	[SerializeField] private GameObject _playerCanvas; 

	private void Awake() 
	{
		DontDestroyOnLoad(this);

		View = GetComponent<PhotonView>(); 

		if (View.IsMine)
			_playerActionControler = new PlayerActionControler();	
	}

	// Use this for initialization
	void Start () 
	{
		if (!View.IsMine) return; 

		_playerCanvas.SetActive(true); 

		foreach(var r in renders)
			r.enabled = false; 

		_camObject.SetActive(true); 

		_controller = GetComponent<CharacterController> ();	
		_myTransform = transform; 
		_speed = WalkSpeed; 
		_rayDistance = _controller.height * .5f + _controller.radius; 
		_slideLimit = _controller.slopeLimit - .1f; 
		// _jumpTimer = AntiBunnyHopFactor; 
		_jumpTimer = 0; 

		_playerActionControler.Normal.Jump.performed += _ => Jump();

		_playerActionControler.Normal.Run.performed += _ => ToggleRunning();
	}

	private void OnEnable() 
	{
		if (View.IsMine)
			_playerActionControler.Enable();	
	}

	private void OnDisable() 
	{
		if (View.IsMine)
			_playerActionControler.Disable();
	}

	private void ToggleRunning()
	{
		if (_speed == WalkSpeed)
			_speed = RunSpeed;
		else 
			_speed = WalkSpeed; 
	}
	
	// Update is called once per frame
	void FixedUpdate () 
	{
		if (CantMove || !View.IsMine) return; 

		float inputX = _playerActionControler.Normal.Horizontal.ReadValue<float>();
		float inputY = _playerActionControler.Normal.Vertical.ReadValue<float>();
		
		float inputModifyFactor = (inputX != 0f && inputY != 0f && LimitDiagonalSpeed)? .7071f : 1f;

		if (inputY == 0 && inputX == 0)
		{
			_anim.SetBool("Moving", false);
			_speed = WalkSpeed;  
		} else if (!_anim.GetBool("Moving"))
			_anim.SetBool("Moving", true); 
			
		if (_grounded)
		{
			_moveDirection = new Vector3(inputX * inputModifyFactor, -AntiBumperFactor, inputY * inputModifyFactor); 
			_moveDirection = _myTransform.TransformDirection(_moveDirection) * _speed; 

			if (_jumpTimer >= AntiBunnyHopFactor)
			{
				_moveDirection.y = JumpSpeed; 
				_jumpTimer = 0; 
			}
			if (_anim.GetBool("InAir"))
				_anim.SetBool("InAir", false);

		} else if (!_anim.GetBool("InAir"))
			_anim.SetBool("InAir", true);  

		if (!_grounded)
		{
			Vector3 temp = new Vector3(_moveDirection.x = inputX * inputModifyFactor, 0, _moveDirection.z = inputY * inputModifyFactor);
			temp = _myTransform.TransformDirection(_moveDirection) * _speed;

			_moveDirection.x = temp.x; 
			_moveDirection.z = temp.z; 
		}

		_moveDirection.y -= Gravity * Time.deltaTime; 
		_grounded = (_controller.Move(_moveDirection * Time.deltaTime) & CollisionFlags.Below) != 0;
	}

	private void Jump()
	{
		if (!_grounded)
			return; 

		_jumpTimer++;
	}

	private void Update()
	{
		if (!View.IsMine) return;

		if (ToggleRun && _grounded && Input.GetButtonDown ("Run"))
			_speed = (_speed == WalkSpeed ? RunSpeed : WalkSpeed); 

		_anim.SetBool("Running", _speed == RunSpeed); 
	}

	private void OnControllerColliderHit(ControllerColliderHit hit)
	{
		_contactPoint = hit.point; 
	}

	public void SetMovement(bool value)
	{
		CantMove = !value; 
		Interaction.CanInteract = value; 
		Attack.CanAttack = value; 
	}

	public void KillPlayer(string killerName, int actorID)
	{
		if (View.Owner.ActorNumber != actorID && View.IsMine)
		{
			print ($"You were killed by {killerName}");
			TeleportPlayer(GamePlayManager.Instance.GetRespawnPoint()); 
		}
	}

	public void TeleportPlayer(Vector3 destination)
	{
		if (View.IsMine)
		{
			_controller.enabled = false; 
			this.transform.position = destination; 
			_controller.enabled = true; 
		}
	}
}

