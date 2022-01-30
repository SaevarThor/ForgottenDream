using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun; 

public class PlayerSpawner : MonoBehaviourPunCallbacks
{
    [SerializeField] private GameObject _player; 
    [SerializeField] private GameObject _manager;
    [SerializeField]private float loadTimer = 20; 
    
    private void Start()
    {
        print ($"Client State = {PhotonNetwork.NetworkClientState}"); 
        GameObject g = PhotonNetwork.Instantiate(_player.name, transform.position, Quaternion.identity);
        Debug.Log($"is connected and ready = {PhotonNetwork.IsConnectedAndReady}, is connected = {PhotonNetwork.IsConnected}, in lobby = {PhotonNetwork.InLobby}, in room = {PhotonNetwork.InRoom}"); 

    }

    // private IEnumerator WaitAndSpawn()
    // {
    //     yield return new WaitForSeconds(1); 
    //     if (!PhotonNetwork.IsConnectedAndReady)
    //     {
    //         print ("No Connection found"); 
    //         Instantiate(_player, transform.position, transform.rotation); 
    //     }
    // }

}
