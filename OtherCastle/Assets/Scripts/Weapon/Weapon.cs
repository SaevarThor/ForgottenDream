using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;

public class Weapon : MonoBehaviour
{   
    public bool IsAttacking; 
    public string attackerName = "DragonSkull69"; 
    public int attackerID; 
    public Rigidbody Body; 
    private PhotonView view; 

    private void Awake()
    {
        Body = GetComponent<Rigidbody>();
        view = GetComponent<PhotonView>();
    }

    public virtual void Attack(float power, PlayerAttack attack){}

    public void OnTriggerEnter(Collider other)
    {
        if (other.tag == "Player" && IsAttacking)
            other.transform.GetComponent<PlayerController>().KillPlayer(view.Owner.NickName, view.Owner.ActorNumber);
    }
}
