using System;
using UnityEngine;

namespace Anchry.Dialogue
{
    [Serializable]
    public class DialogueNodeData : NodeData
    {  
        public string DialogueText;
        public bool IsEndNode; 
        public int ActorID; 
    }
}
