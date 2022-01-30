using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun; 
using TMPro; 
using UnityEngine.UI; 

public class MainMenuManager : MonoBehaviourPunCallbacks
{
    private string[] names = {"dickman", "snake", "gotPoop?", "Casper"}; 
    [SerializeField] private GameObject _player;

    [SerializeField] private string _sceneName = "MainScene"; 

    public TMP_InputField inputs; 
    public Button Button; 
    public TMP_Text text; 

    void Start()
    {
        PhotonNetwork.ConnectUsingSettings();
        Button.onClick.AddListener(CheckRoom); 
    }

    public override void OnConnectedToMaster()
    {
        PhotonNetwork.JoinLobby();
    }

    private void CheckRoom()
    {
        PhotonNetwork.JoinOrCreateRoom("dank", null, null); 

        if (String.IsNullOrEmpty(inputs.text))
            PhotonNetwork.LocalPlayer.NickName = names[UnityEngine.Random.Range(0, names.Length)]; 
        else 
            PhotonNetwork.LocalPlayer.NickName = inputs.text; 
    }

    public override void OnJoinedLobby()
    {
        print ($"rooms ={PhotonNetwork.CountOfRooms}"); 
        Button.interactable = true; 
    }

    private  void Update()
    {
        text.text = $"Client state: {PhotonNetwork.NetworkClientState}"; 
        
    }

    public override void OnJoinedRoom()
    {
        //PhotonNetwork.Instantiate(_player.name, _player.transform.position, Quaternion.identity); 
        PhotonNetwork.AutomaticallySyncScene = true; 
        PhotonNetwork.LoadLevel(_sceneName); 
    }
}
