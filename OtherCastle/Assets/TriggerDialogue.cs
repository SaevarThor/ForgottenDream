using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Anchry.Dialogue; 

public class TriggerDialogue : MonoBehaviour
{
    public DialogueContainer Container;
    public string CharName; 
    
    private void OnTriggerEnter(Collider other)
    {
        if (other.tag == "Player")
        {
            Dialogue.Instance.StartDialogue(Container, other.GetComponent<PlayerController>(), CharName); 
        }
    }
}
