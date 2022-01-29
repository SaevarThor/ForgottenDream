using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;

public class PlayerAttack : MonoBehaviour
{
    [SerializeField] private Transform _clientHold; 
    public PhotonView View; 
    public bool CanAttack; 
    public bool HasWeapon; 
    [SerializeField] private GameObject clientSpear, serverSpear; 
    [SerializeField] private GameObject spearObject; 

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
        {
            _playerActionController.Normal.Shoot.performed += _ =>  Attack();   
            CanAttack = true;  
        }
    }

    private void Attack()
    {
        if (!HasWeapon || !View.IsMine || !CanAttack) return;

        GameObject g = PhotonNetwork.Instantiate(spearObject.name, _clientHold.transform.position, _clientHold.transform.rotation); 
        Weapon currWeapon = g.GetComponent<Weapon>();
        currWeapon.Attack(2, this);  

        HideWeapon(); 
    }

    private void HideWeapon()
    {
        serverSpear.SetActive(false);
        clientSpear.SetActive(false); 
        HasWeapon = false;
    }

    public void PickUpWeapon()
    {
        serverSpear.SetActive(true); 
        // clientSpear.SetActive(true); 
        HasWeapon = true; 
    }
}
