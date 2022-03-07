using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class StonePuzzle
{
    private int stonesPressed = 0; 
    private int allStones = 4; 
    public GameObject StoneEnding; 

    public void AddStone(GhostPoint point, Ghost ghost, GameObject ghostTower)
    {
        stonesPressed ++; 

        if (HasAllStones())
        {
            //GameObject.Instantiate(StoneEnding); 
            ghostTower.SetActive(true); 
            ghost.gameObject.SetActive(true);
            ghost.Spawn(point);  
        }
    }

    public bool HasAllStones()
    {
        return stonesPressed == allStones; 
    }

}
