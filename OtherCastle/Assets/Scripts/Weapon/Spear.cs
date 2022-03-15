using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Spear : Weapon
{
    // [SerializeField] private float throwPower = 200; 
    // private PlayerAttack owner; 

    // public Vector3 dir => this.transform.forward; 

    private void Start()
    {
        Body.AddForce(transform.forward * (AttackPower * 2)); 
    }
}
