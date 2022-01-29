using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;

public class PlayerAttack : MonoBehaviour
{
    private bool _isHoldingWeapon; 

    private Weapon _currWeapon;

    [SerializeField] private Transform _holdPos; 
    public PhotonView View; 

    private PlayerActionControler _playerActionController;
    
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
            _playerActionController.Normal.Shoot.performed += _ =>  Attack();    
    }

    private void Attack()
    {
        if (_currWeapon == null) return;

        if (_currWeapon.DropAfterAttack)
            ReleaseWeapon();

        _currWeapon.Attack();  
    }

    public void PickUpWeapon(Weapon weapon)
    {
        if (_isHoldingWeapon)
            ReleaseWeapon(); 

        _currWeapon = weapon; 

        _currWeapon.transform.parent = _holdPos; 
        _currWeapon.transform.rotation = _holdPos.rotation; 
    }

    private void ReleaseWeapon()
    {
        _currWeapon.transform.parent = null; 
        _currWeapon.IsAttacking = false; 
        _currWeapon.Body.isKinematic = false;
    }
}
