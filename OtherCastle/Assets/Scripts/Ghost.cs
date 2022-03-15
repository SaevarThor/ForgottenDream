using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Ghost : MonoBehaviour
{
    [SerializeField] private List<GhostPoint> points = new List<GhostPoint>();

    public GhostPoint Next; 

    private bool canTeleport = true; 

    public void Spawn(GhostPoint point)
    {
        Next = point; 
        Teleport(Next.Point);
    }

    public void Teleport(Vector3 point)
    {
        transform.position = point; 
    }

    private void OnTriggerEnter(Collider other) {
        if (other.tag == "Player" && canTeleport)
        {
            if (Next.IsGhostTower)
            {
                this.gameObject.SetActive(false);
                return; 
            }

            if (Next != null && Next.ConnectionPoint != null)
            {
                Teleport(Next.ConnectionPoint.position); 
                Next = Next.ConnectionPoint.GetComponent<GhostPoint>();
            }
            canTeleport = false;
            StartCoroutine(Wait()); 
        }
    }

    private IEnumerator Wait()
    {
        yield return new WaitForSeconds(1f); 
        canTeleport = true; 

    }
}
