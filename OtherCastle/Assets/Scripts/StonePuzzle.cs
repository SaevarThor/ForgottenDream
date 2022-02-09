using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class StonePuzzle
{
    private int stonesPressed = 0; 
    private int allStones = 4; 
    public GameObject StoneEnding; 
    public Ghost Ghost;


    public void AddStone(GhostPoint point)
    {
        stonesPressed ++; 

        if (HasAllStones())
        {
            //End Puzzle
            GameObject.Instantiate(StoneEnding); 
            Ghost.gameObject.SetActive(true);

            Ghost.Spawn(point);  
        }
    }

    public bool HasAllStones()
    {
        return stonesPressed == allStones; 
    }

}
