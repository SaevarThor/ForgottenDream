using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Spear : Weapon
{
    private float throwPower = 200; 
    private PlayerAttack owner; 

    void Start()
    {
        Body.AddForce(transform.forward * throwPower); 
    }
}
