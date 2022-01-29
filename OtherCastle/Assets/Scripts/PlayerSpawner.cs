using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun; 

public class PlayerSpawner : MonoBehaviourPunCallbacks
{
    [SerializeField] private GameObject _player; 
    
    private void Start()
    {
        StartCoroutine(WaitAndSpawn()); 
    }

    private IEnumerator WaitAndSpawn()
    {
        yield return new WaitForSeconds(20f); 
        GameObject g = PhotonNetwork.Instantiate(_player.name, transform.position, Quaternion.identity);
        print ("Spawn " + Time.time.ToString()); 
    }

}
