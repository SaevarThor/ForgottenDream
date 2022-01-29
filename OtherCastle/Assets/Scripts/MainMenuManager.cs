using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun; 

public class MainMenuManager : MonoBehaviourPunCallbacks
{
    private string[] names = {"dickman", "snake", "gotPoop?", "Casper"}; 

    [SerializeField] private string _sceneName = "TestScene"; 

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
        PhotonNetwork.LocalPlayer.NickName = names[Random.Range(0, names.Length)]; 
        PhotonNetwork.JoinOrCreateRoom("Europe", null, null); 
    }

    public override void OnJoinedRoom()
    {
        PhotonNetwork.LoadLevel(_sceneName); 
    }
}
