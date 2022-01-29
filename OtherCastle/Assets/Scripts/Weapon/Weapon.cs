using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Weapon : MonoBehaviour, IInteractible
{
    public bool IsAttacking; 
    public bool DropAfterAttack; 
    public string attackerName = "DragonSkull69"; 

    public Rigidbody Body; 

    private void Start()
    {
        Body = GetComponent<Rigidbody>();
    }

    public virtual void Attack(){}

    public void OnTriggerEnter(Collider other)
    {
        if (other.tag == "Player" && IsAttacking)
            other.transform.GetComponent<PlayerController>().KillPlayer(attackerName);
    }

    public void Interact(PlayerController player)
    {
    }
}
