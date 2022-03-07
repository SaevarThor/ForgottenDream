using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Stone : MonoBehaviour, IInteractible
{   
    private bool _hasInteracted; 
    [SerializeField] private GhostPoint point; 
    [SerializeField] private Ghost ghost; 
    [SerializeField] private GameObject ghostTower; 

    public void Interact(PlayerController player)
    {
        if (_hasInteracted) return; 
        int id = player.View.Owner.ActorNumber; 
        player.Puzzle.AddStone(point, ghost, ghostTower); 

        GetComponent<Animator>().SetBool("Push", true);
        GetComponent<AudioSource>().Play();
        this.GetComponent<BoxCollider>().enabled =  false; 
        _hasInteracted = true; 
    }
}
