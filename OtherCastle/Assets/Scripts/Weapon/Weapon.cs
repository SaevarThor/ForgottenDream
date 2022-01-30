using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;

public class Weapon : MonoBehaviourPun
{   
    public bool IsAttacking; 
    public string attackerName = "DragonSkull69"; 
    public int attackerID; 
    public Rigidbody Body; 
    public PhotonView view; 
    public float AttackPower = 400;

    private void Awake()
    {
        Body = GetComponent<Rigidbody>();
        view = GetComponent<PhotonView>();
        view.RPC("DestroyObject", RpcTarget.AllBuffered, true); 
    }

    private void Start()
    {
        Body.AddForce(transform.forward * AttackPower); 
    }

    public virtual void Attack(float power, PlayerAttack attack){}

    public void OnTriggerEnter(Collider other)
    {
        if (other.tag == "Player" && IsAttacking)
            other.transform.GetComponent<PlayerController>().KillPlayer(view.Owner.NickName, view.Owner.ActorNumber);
    }

    [PunRPC]
    public void DestroyObject(bool value)
    {
        Destroy(this.gameObject, 1);
    }
}
