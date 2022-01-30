using System.Collections;
using System.Collections.Generic;
using Photon.Pun;
using UnityEngine;

public class PickupSpear : MonoBehaviour, IInteractible
{
    public GameObject spearVisual; 
    [SerializeField] private float respawnTimer;

    public PhotonView PV; 

    

    public void Interact(PlayerController player)
    {
        player.Attack.PickUpWeapon();
        // spearVisual.SetActive(false); 
        PV.RPC("SetObject", RpcTarget.AllBuffered,false);
        StartCoroutine(WaitAndRespawn()); 

        this.transform.tag = "";
    }

    [PunRPC]
    private void SetObject(bool value)
    {
        spearVisual.SetActive(value); 

    }


    private IEnumerator WaitAndRespawn()
    {
        yield return new WaitForSeconds(respawnTimer);
        spearVisual.SetActive(true); 
        this.transform.tag = "Interactible"; 
    }
}
