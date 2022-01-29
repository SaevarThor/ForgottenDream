using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GamePlayManager : MonoBehaviour
{
    public static GamePlayManager Instance; 
    public Transform RespawnPoint; 


    private void Awake()
    {
        if (Instance != this && Instance != null)
            Destroy(this); 
        else 
            Instance = this; 
    }

    public Vector3 GetRespawnPoint()
    {
        return RespawnPoint.position; 
    }
}
