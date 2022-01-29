using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PickupSpear : MonoBehaviour, IInteractible
{
    public GameObject spearVisual; 

    [SerializeField] private float respawnTimer;

    public void Interact(PlayerController player)
    {
        player.Attack.PickUpWeapon();
        spearVisual.SetActive(false); 

        StartCoroutine(WaitAndRespawn()); 
    }


    private IEnumerator WaitAndRespawn()
    {
        yield return new WaitForSeconds(respawnTimer);
        spearVisual.SetActive(true); 
    }
}
