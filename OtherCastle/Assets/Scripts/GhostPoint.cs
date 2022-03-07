using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GhostPoint : MonoBehaviour
{
    public Transform ConnectionPoint; 
    public Vector3 Point; 
    public bool IsGhostTower;

    private void Awake() {
        Point = this.transform.position; 
    }
}
