using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Stone : MonoBehaviour, IInteractible
{
    public List<int> playerID = new List<int>();
    public void Interact(PlayerController player)
    {
        //TODO: Switch id to GUID. 
        int id = player.View.Owner.ActorNumber; 
        if (playerID.Contains(id)) return; 

        playerID.Add(id);
        player.Puzzle.AddStone(); 
    }
}
