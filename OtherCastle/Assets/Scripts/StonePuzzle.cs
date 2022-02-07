using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class StonePuzzle
{
    private int stonesPressed = 0; 
    public int AllStones; 
    public GameObject StoneEnding; 
    public Ghost Ghost;
    public GhostPoint ClosestPoint; 


    public void AddStone()
    {
        stonesPressed ++; 

        if (HasAllStones())
        {
            //End Puzzle
            GameObject.Instantiate(StoneEnding); 
            Ghost.gameObject.SetActive(true);

            Ghost.Next = ClosestPoint; 
        }
    }

    public bool HasAllStones()
    {
        return stonesPressed == AllStones; 
    }

}
