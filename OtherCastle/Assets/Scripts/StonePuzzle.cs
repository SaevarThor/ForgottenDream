using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class StonePuzzle
{
    private int stonesPressed = 0; 

    public int AllStones; 


    public void AddStone()
    {
        stonesPressed ++; 

        if (HasAllStones())
        {
            //End Puzzle
        }
    }

    public bool HasAllStones()
    {
        return stonesPressed == AllStones; 
    }

}
