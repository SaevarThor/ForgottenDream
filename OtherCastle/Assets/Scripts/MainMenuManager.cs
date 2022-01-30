using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun; 

public class MainMenuManager : MonoBehaviourPunCallbacks
{
    private string[] names = {"dickman", "snake", "gotPoop?", "Casper"}; 
    [SerializeField] private GameObject _player;

    [SerializeField] private string _sceneName = "MainScene"; 

    void Start()
    {
        PhotonNetwork.ConnectUsingSettings();
    }

    public override void OnConnectedToMaster()
    {
        PhotonNetwork.JoinLobby();
    }

    public override void OnJoinedLobby()
    {
        print ($"rooms ={PhotonNetwork.CountOfRooms}"); 
        PhotonNetwork.LocalPlayer.NickName = names[Random.Range(0, names.Length)]; 
        PhotonNetwork.JoinOrCreateRoom("dank", null, null); 
    }

    private  void Update()
    {
        print ($"Loading: {PhotonNetwork.LevelLoadingProgress} Client state {PhotonNetwork.NetworkClientState}"); 
        
    }

    public override void OnJoinedRoom()
    {
        //PhotonNetwork.Instantiate(_player.name, _player.transform.position, Quaternion.identity); 
        PhotonNetwork.AutomaticallySyncScene = true; 
        PhotonNetwork.LoadLevel(_sceneName); 
    }
}
