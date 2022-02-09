using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Stone : MonoBehaviour, IInteractible
{
    public List<int> playerID = new List<int>();

    private bool _hasInteracted; 

    [SerializeField] private GhostPoint point; 


    void Start()
    {
    }

    public void Interact(PlayerController player)
    {
        if (_hasInteracted) return; 
        //TODO: Switch id to GUID. 
        int id = player.View.Owner.ActorNumber; 
        //if (playerID.Contains(id)) return; 

        //playerID.Add(id);
        player.Puzzle.AddStone(point); 
        _hasInteracted = true; 
    }
}
