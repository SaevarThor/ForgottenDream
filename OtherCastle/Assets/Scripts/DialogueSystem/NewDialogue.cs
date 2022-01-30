using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Anchry.Dialogue; 

public class NewDialogue : MonoBehaviour, IInteractible
{

    public DialogueContainer Conversation; 
    public string CharacterName; 
    public Sprite CharacterPortrait; 

    public void Interact(PlayerController player)
    {
        if (player.View.IsMine)
            Dialogue.Instance.StartDialogue(Conversation ,player ,CharacterName, CharacterPortrait); 
    }
}
