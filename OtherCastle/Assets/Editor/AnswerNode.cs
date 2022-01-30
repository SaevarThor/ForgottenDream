using UnityEngine;
using Anchry.Dialogue; 
using System; 

[Serializable]
public class AnswerNode : NodeProperties
{
    public int AnswerDataID; 
    public int AnswerValue; 

    public void TranslateAnswerData(string value)
    {
        string[] crewNames = System.Enum.GetNames(typeof(DialougeEnum.AnswerEnum));

        for(int i = 0; i < crewNames.Length; i++)
        {
            if (value == crewNames[i])
            {
                AnswerDataID = i; 
                return;
            }
        }
        Debug.LogError($"[AnswerNode] Error setting id for {value}"); 
    }
}
