using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement; 

public class LoadManager : MonoBehaviour
{
    public PlayerController Player; 

    void Start()
    {
        DontDestroyOnLoad(this.gameObject); 
    }
    private Vector3 sp = new Vector3(155.5f,36.83f,83.77138f); 
    private bool done; 

    void Update()
    {
        if (SceneManager.GetActiveScene().name == "MainScene")
        {
            Player.TeleportPlayer(sp); 
            Destroy(this); 
        }   
    }
}
