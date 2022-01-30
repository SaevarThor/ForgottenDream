using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro; 

public class KilledText : MonoBehaviour
{

    public static KilledText Instnance; 


    void Awake()
    {
        if (Instnance != this && Instnance != null)
            Destroy(this); 
        else 
            Instnance = this; 
    }

    public TMP_Text killtext; 
    public GameObject KillObject; 

   public void SetKillText(string name)
   {
       killtext.text = "You were killed by "  + name; 
       KillObject.SetActive(true);

       StartCoroutine(HideText()); 
   }

   private IEnumerator HideText()
   {
       yield return new WaitForSeconds(4); 
       KillObject.SetActive(false); 
   }
}
