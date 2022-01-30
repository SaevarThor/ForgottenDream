using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Killzone : MonoBehaviour
{
    public Transform respawn;
   private void OnTriggerEnter(Collider other)
   {
       if(other.tag == "Player")
        other.transform.GetComponent<PlayerController>().TeleportPlayer(respawn.position); 
   }
}
