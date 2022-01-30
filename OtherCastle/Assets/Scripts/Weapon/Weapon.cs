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

    public float AttackPower = 400;

    private void Awake()
    {
        Body = GetComponent<Rigidbody>();
        view = GetComponent<PhotonView>();

        StartCoroutine(WaitAndDie()); 
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

    private IEnumerator WaitAndDie()
    {
        yield return new WaitForSeconds(1);

        view.RPC("Die", RpcTarget.AllBuffered); 
    }

    [PunRPC]
    private void Die()
    {
        Destroy(this.gameObject);
    }
}
