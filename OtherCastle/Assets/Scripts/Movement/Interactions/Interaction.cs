using UnityEngine;
using UnityEngine.UI; 
using Photon.Pun; 

public class Interaction : MonoBehaviour
{
    private const string InteractibleTag = "Interactible"; 
    [SerializeField] private PlayerController _controller;
    [SerializeField] private Camera _camera;
    [SerializeField] private float _range; 

    [Header ("UI Elements")]
    [SerializeField] private Image _image; 
    [SerializeField] private Sprite _crosshair;
    [SerializeField] private Sprite _hand; 
    
    // private KeyCode _interactKey => InputManager.Instance.InteractKey; 
    private PlayerActionControler _playerActionController;
    private bool _canInteract = true; 
    Ray _ray; 

    private PhotonView View; 

    private void OnEnable() 
    {
        if (View.IsMine)
            _playerActionController.Enable();	
    }

    private void OnDisable() 
    {
        if (View.IsMine)
            _playerActionController.Disable();
    }

    private void Awake() 
	{
		View = GetComponent<PhotonView>(); 

		if (View.IsMine)
			_playerActionController = new PlayerActionControler();	
	}

    private void Start() 
    {
        if (View.IsMine)
            _playerActionController.Normal.Interact.performed += _ =>  Interact();    
    }

    private void Update()
    {
       /* if (!_canInteract && View.IsMine) return;

        _image.enabled = !Dialogue.Instance.ActiveDialogue;
        
        _ray = _camera.ViewportPointToRay(new Vector3(.5f,.5f,0)); 

        //Check for interactible to change UI elements
        RaycastHit hit; 

        if (Physics.Raycast(_ray, out hit, _range))
        {
            if (hit.collider.CompareTag(InteractibleTag))
                _image.sprite = _hand; 
            else
                _image.sprite = _crosshair; 
        } else 
            _image.sprite = _crosshair; */

    }

    public void Interact()
    {
        print ("Itneract"); 
        RaycastHit hit; 
        // _ray = new Ray();

        if (Physics.Raycast(_ray, out hit, _range))
        {
            print (hit.collider.name); 
            if (hit.collider.CompareTag(InteractibleTag))
                hit.transform.GetComponent<IInteractible>().Interact(_controller);
        }
    }
}
