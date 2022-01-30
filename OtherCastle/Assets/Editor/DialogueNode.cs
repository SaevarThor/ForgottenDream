# if UNITY_EDITOR 
using UnityEditor.Experimental.GraphView; 

namespace Anchry.Dialogue
{
    public class DialogueNode : NodeProperties
    {
        // public string GUID; 
        public string DialogueText; 
        // public bool EntryPoint = false; 
        public bool IsEndNode; 
        public int ActorIndex; 
    }
}
#endif