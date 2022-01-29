using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun; 

public class PlayerSpawner : MonoBehaviour
{
    [SerializeField] private GameObject _player; 
    
    private void Start()
    {
        PhotonNetwork.Instantiate(_player.name, _player.transform.position, Quaternion.identity); 
    }
}
