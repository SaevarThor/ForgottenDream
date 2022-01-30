using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun; 

public class LoadNextLevel : MonoBehaviour
{
    public GameObject text;

    void Start()
    {
        StartCoroutine(waitAndLoad()); 
    }

    private IEnumerator waitAndLoad()
    {
        yield return new WaitForSeconds(14); 
        text.SetActive(true); 
        yield return new WaitForSeconds(1); 

        //Show Loading
        PhotonNetwork.LoadLevel("MainScene"); 
    }
}
