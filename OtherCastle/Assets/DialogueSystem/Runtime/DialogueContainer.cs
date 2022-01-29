using System;
using System.Collections.Generic;
using UnityEngine;

namespace Anchry.Dialogue
{
    [Serializable]
    public class DialogueContainer : ScriptableObject
    {
        public List<NodeLinkData> NodeLinks = new List<NodeLinkData>();
        public List<DialogueNodeData> DialogueNodeDatas = new List<DialogueNodeData>();
        public List<AttributeNodeData> AttributeNodeDatas = new List<AttributeNodeData>();
        public List<CrewNodeData> CrewNodeDatas = new List<CrewNodeData>();
        public List<TraitNodeData> TraitNodeDatas = new List<TraitNodeData>();
        public List <AnswerNodeData> AnswerNodeDatas = new List<AnswerNodeData>();
        public List<ExposedProperty> ExposedProperties = new List<ExposedProperty>();
    }
}
