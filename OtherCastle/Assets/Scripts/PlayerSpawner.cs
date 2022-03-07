using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun; 

public class PlayerSpawner : MonoBehaviourPunCallbacks
{
    [SerializeField] private GameObject _player; 
    [SerializeField] private GameObject _manager;
    
    private void Start()
    {
        print ($"Client State = {PhotonNetwork.NetworkClientState}"); 
        GameObject g = PhotonNetwork.Instantiate(_player.name, transform.position, Quaternion.identity);
        Debug.Log($"is connected and ready = {PhotonNetwork.IsConnectedAndReady}, is connected = {PhotonNetwork.IsConnected}, in lobby = {PhotonNetwork.InLobby}, in room = {PhotonNetwork.InRoom}"); 

    }
}
