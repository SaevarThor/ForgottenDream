using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Ghost : MonoBehaviour
{
    [SerializeField] private List<GhostPoint> points = new List<GhostPoint>();

    public GhostPoint Next; 

    public void Spawn(GhostPoint point)
    {
        Next = point; 
        Teleport(Next.Point);
    }

    public void Teleport(Vector3 point)
    {
        transform.position = point; 
    }
}
