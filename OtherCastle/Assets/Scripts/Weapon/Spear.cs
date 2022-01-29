using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Spear : Weapon
{
    private float throwPower = 400; 

    public override void Attack()
    {
        //Play Animation
        StartCoroutine(Release()); 
    }

    private IEnumerator Release()
    {
        yield return new WaitForSeconds(.5f);
        Body.AddForce(transform.forward * throwPower); 

    }
}
