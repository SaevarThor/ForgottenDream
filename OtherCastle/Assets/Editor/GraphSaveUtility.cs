using System.Net;
using System;
using System.Collections.Generic;
using System.Linq;
# if UNITY_EDITOR 
using UnityEditor;
using UnityEditor.Experimental.GraphView;
#endif
using UnityEngine;
using UnityEngine.UIElements;

namespace Anchry.Dialogue
{
    public class GraphSaveUtility 
    {
# if UNITY_EDITOR 

        private DialogueGraphView _targetGraphView; 
        private DialogueContainer _containerCache; 

        private List<Edge> Edges => _targetGraphView.edges.ToList();
        private List<DialogueNode> Nodes => GetDialogueNodes();
        private List<AttributeNode> AttributeNodes => GetAttributeNodes();
        private List<TraitNode> TraitNodes => GetTraitNodes();
        private List<CrewMemberNode> CrewMemberNodes => GetCrewMemberNodes();
        private List<AnswerNode> AnswerNodes => GetAnswerNodes();
        private List<EndNode> EndNodes => GetEndNodes();

        public static GraphSaveUtility GetInstance(DialogueGraphView targetGraphView)
        {

            return new GraphSaveUtility
            {
                _targetGraphView = targetGraphView
            }; 
        }

        public void SaveGraph(string fileName)
        {
            var dialogueContainer = ScriptableObject.CreateInstance<DialogueContainer>();

            if(!SaveNodes(dialogueContainer)) return; 
            SaveExposedProperties(dialogueContainer);

            if (!AssetDatabase.IsValidFolder("Assets/Resources"))
                AssetDatabase.CreateFolder("Assets", "Resources"); 

            AssetDatabase.CreateAsset(dialogueContainer, $"Assets/Resources/{fileName}.asset"); 
            AssetDatabase.SaveAssets();        
        }

        private void SaveExposedProperties(DialogueContainer dialogueContainer)
        {
           dialogueContainer.ExposedProperties.AddRange(_targetGraphView.ExposedProperties);  
        }

        private bool SaveNodes(DialogueContainer container)
        {
            if (!Edges.Any()) return false; 


            var ports = Edges.ToArray();

            for (int i = 0; i < ports.Length; i ++ )
            {
                var outputNode = ports[i].output.node as NodeProperties; 
                var inputNode = ports[i].input.node as NodeProperties;  

                container.NodeLinks.Add(new NodeLinkData
                {
                    BaseNodeGUID = outputNode.GUID, 
                    PortName = ports[i].output.portName, 
                    TargetNodeGUID = inputNode.GUID
                });
            }  

            foreach (var dialogueNode in Nodes.Where(node => !node.EntryPoint))            
            {
                container.DialogueNodeDatas.Add(new DialogueNodeData
                {
                    NodeGUID = dialogueNode.GUID,
                    DialogueText = dialogueNode.DialogueText,
                    Position = dialogueNode.GetPosition().position,
                    ActorID = dialogueNode.ActorIndex,
                    IsEndNode = dialogueNode.IsEndNode
                });
            } 

            foreach (var attNode in AttributeNodes.Where(node => !node.EntryPoint))
            {
                container.AttributeNodeDatas.Add
                (
                    new AttributeNodeData
                    {
                        NodeGUID = attNode.GUID,
                        Position = attNode.GetPosition().position,
                        AttributeID = attNode.AttributeID
                    }
                );
            }

            foreach (var traitNode in TraitNodes.Where(node => !node.EntryPoint))
            {
                container.TraitNodeDatas.Add
                (
                    new TraitNodeData
                    {
                        NodeGUID = traitNode.GUID,
                        Position = traitNode.GetPosition().position,
                        TraitID = traitNode.TraitID,
                    }
                );
            }

            foreach (var crewNode in CrewMemberNodes.Where(node => !node.EntryPoint))
            {
                container.CrewNodeDatas.Add
                (
                    new CrewNodeData
                    {
                        NodeGUID = crewNode.GUID,
                        Position = crewNode.GetPosition().position,
                    }
                );
            }

            foreach (var answerNode in AnswerNodes.Where(node => !node.EntryPoint))
            {
                container.AnswerNodeDatas.Add
                (
                    new AnswerNodeData
                    {
                        NodeGUID = answerNode.GUID,
                        Position = answerNode.GetPosition().position,
                        AnswerNodeID = answerNode.AnswerDataID,
                        AnswerNodeValue = answerNode.AnswerValue
                    }
                );
            }

            // foreach ( var endNode in )
            // {
                
            // }

            return true;     
        }

        public void LoadGraph(string fileName)
        {
            _containerCache = Resources.Load<DialogueContainer>(fileName); 

            if (_containerCache == null)
            {
                EditorUtility.DisplayDialog("Conversation not found Jonathan", "Please write in the correct name of the dialogue you want to load sir.", "I am a slut"); 
                return; 
            }

            ClearGraph();
            CreateNodes();
            ConnectNodes();
            // CreateExposedProperties();
        }

        private void CreateExposedProperties()
        {
            _targetGraphView.ClearBlackBoardAndExposedProperties();
            foreach(var exposedProperty in _containerCache.ExposedProperties)
            {
                _targetGraphView.AddPropertyToBlackBoard(exposedProperty); 
            }
        }

        private void ConnectNodes()
        {
             for (var i = 0; i < Nodes.Count; i++)
            {
                var k = i; //Prevent access to modified closure
                var connections = _containerCache.NodeLinks.Where(x => x.BaseNodeGUID == Nodes[k].GUID).ToList();
                for (var j = 0; j < connections.Count(); j++)
                {
                    var targetNodeGUID = connections[j].TargetNodeGUID;
                    var targetNode = FindTargetNode(targetNodeGUID); 
                    LinkNodes(Nodes[i].outputContainer[j].Q<Port>(), (Port) targetNode.inputContainer[0]);

                    SetTargetNodePosition(targetNode, targetNodeGUID);
                }
            }

            for (int i = 0; i < AttributeNodes.Count; i++)
            {
                var k = i; 
                var connection = _containerCache.NodeLinks.Where(x => x.BaseNodeGUID == AttributeNodes[k].GUID).ToList();
                
                for (int j = 0; j < connection.Count(); j++)
                {
                    var targetNodeGUID = connection[j].TargetNodeGUID; 
                    var targetNode = FindTargetNode(targetNodeGUID); 
                    LinkNodes(AttributeNodes[i].outputContainer[j].Q<Port>(), (Port) targetNode.inputContainer[0]); 

                    SetTargetNodePosition(targetNode, targetNodeGUID);
                }
            }

            for (int i = 0; i < TraitNodes.Count; i++)
            {
                var k = i; 
                var connection = _containerCache.NodeLinks.Where(x => x.BaseNodeGUID == TraitNodes[k].GUID).ToList();
                
                for (int j = 0; j < connection.Count(); j++)
                {
                    var targetNodeGUID = connection[j].TargetNodeGUID; 
                    var targetNode = FindTargetNode(targetNodeGUID); 
                    LinkNodes(TraitNodes[i].outputContainer[j].Q<Port>(), (Port) targetNode.inputContainer[0]); 

                    SetTargetNodePosition(targetNode, targetNodeGUID);
                }
            }

            for (int i = 0; i < CrewMemberNodes.Count; i++)
            {
                var k = i; 
                var connection = _containerCache.NodeLinks.Where(x => x.BaseNodeGUID == CrewMemberNodes[k].GUID).ToList();
                
                for (int j = 0; j < connection.Count(); j++)
                {
                    var targetNodeGUID = connection[j].TargetNodeGUID; 
                    var targetNode = FindTargetNode(targetNodeGUID); 

                    LinkNodes(CrewMemberNodes[i].outputContainer[j].Q<Port>(), (Port) targetNode.inputContainer[0]); 

                    SetTargetNodePosition(targetNode, targetNodeGUID);
                }
            }

            for (int i = 0; i < AnswerNodes.Count; i++)
            {
                var k = i; 
                var connection = _containerCache.NodeLinks.Where(x => x.BaseNodeGUID == AnswerNodes[k].GUID).ToList();
                
                for (int j = 0; j < connection.Count(); j++)
                {
                    var targetNodeGUID = connection[j].TargetNodeGUID; 
                    var targetNode = FindTargetNode(targetNodeGUID); 
                    LinkNodes(AnswerNodes[i].outputContainer[j].Q<Port>(), (Port) targetNode.inputContainer[0]); 

                    SetTargetNodePosition(targetNode, targetNodeGUID);
                }
            }
        }

        private void SetTargetNodePosition(NodeProperties targetNode, string targetNodeGUID)
        {
            if (targetNode is DialogueNode)
                targetNode.SetPosition(new Rect(
                    _containerCache.DialogueNodeDatas.First(x => x.NodeGUID == targetNodeGUID).Position,
                    _targetGraphView.DefaultNodeSize));
            
            if (targetNode is AttributeNode)
                targetNode.SetPosition(new Rect(
                    _containerCache.AttributeNodeDatas.First(x => x.NodeGUID == targetNodeGUID).Position,
                    _targetGraphView.DefaultNodeSize));
            
            if (targetNode is TraitNode)
                targetNode.SetPosition(new Rect(
                    _containerCache.TraitNodeDatas.First(x => x.NodeGUID == targetNodeGUID).Position,
                    _targetGraphView.DefaultNodeSize));         
        
            if (targetNode is CrewMemberNode)
                targetNode.SetPosition(new Rect(
                    _containerCache.CrewNodeDatas.First(x => x.NodeGUID == targetNodeGUID).Position,
                    _targetGraphView.DefaultNodeSize));  
            
            if (targetNode is AnswerNode)
                targetNode.SetPosition(new Rect(
                    _containerCache.AnswerNodeDatas.First(x => x.NodeGUID == targetNodeGUID).Position,
                    _targetGraphView.DefaultNodeSize)); 
        }

        private void LinkNodes(Port outputSocket, Port inputSocket)
        {
            var tempEdge = new Edge
            {
                output = outputSocket,
                input = inputSocket 
            };

            tempEdge?.input.Connect(tempEdge); 
            tempEdge?.output.Connect(tempEdge); 
            _targetGraphView.Add(tempEdge); 
        }

        private void CreateNodes()
        {
            foreach(var nodeData in _containerCache.DialogueNodeDatas)
            {
                var tempNode = _targetGraphView.CreateDialogueNode(nodeData.DialogueText, Vector2.zero);
                tempNode.GUID = nodeData.NodeGUID; 
                tempNode.IsEndNode = nodeData.IsEndNode; 
                _targetGraphView.AddElement(tempNode); 

                var nodePorts = _containerCache.NodeLinks.Where(x => x.BaseNodeGUID == nodeData.NodeGUID).ToList();
                nodePorts.ForEach(x => _targetGraphView.AddChoicePort(tempNode, x.PortName));
            }

            foreach(var nodeData in _containerCache.AttributeNodeDatas)
            {
                var tempNode = _targetGraphView.CreateAttributeNode("Attribute Node", Vector2.zero, nodeData.AttributeID);
                tempNode.GUID = nodeData.NodeGUID; 
                tempNode.AttributeID = nodeData.AttributeID; 
                _targetGraphView.AddElement(tempNode); 

                var nodePorts = _containerCache.NodeLinks.Where(x => x.BaseNodeGUID == nodeData.NodeGUID).ToList();
            }

            foreach(var nodeData in _containerCache.CrewNodeDatas)
            {
                var tempNode = _targetGraphView.CreateCrewNode("Crew Node", Vector2.zero);
                tempNode.GUID = nodeData.NodeGUID;
                _targetGraphView.AddElement(tempNode); 

                var nodePorts = _containerCache.NodeLinks.Where(x => x.BaseNodeGUID == nodeData.NodeGUID).ToList();
            }

            foreach (var nodeData in _containerCache.TraitNodeDatas)
            {
                var tempNode = _targetGraphView.CreateTraitNode("Trait Node", Vector2.zero, nodeData.TraitID); 
                tempNode.GUID = nodeData.NodeGUID; 
                _targetGraphView.AddElement(tempNode); 

                var nodePorts = _containerCache.NodeLinks.Where(x => x.BaseNodeGUID == nodeData.NodeGUID).ToList();
            }

            foreach (var nodeData in _containerCache.AnswerNodeDatas)
            {
                var tempNode = _targetGraphView.CreateAnswerNode("Answer Node", Vector2.zero, nodeData.AnswerNodeID, nodeData.AnswerNodeValue); 
                tempNode.GUID = nodeData.NodeGUID; 
                _targetGraphView.AddElement(tempNode); 

                var nodePorts = _containerCache.NodeLinks.Where(x => x.BaseNodeGUID == nodeData.NodeGUID).ToList();
            }
        }

        private void ClearGraph()
        {
           Nodes.Find(x => x.EntryPoint).GUID = _containerCache.NodeLinks[0].BaseNodeGUID; 

           foreach(var node in Nodes)
           {
               if (node.EntryPoint) continue;
               Edges.Where(x => x.input.node == node).ToList()
                    .ForEach(edge => _targetGraphView.RemoveElement(edge));  
           
                _targetGraphView.RemoveElement(node); 
           } 

        //    AttributeNodes.Find(x => x.EntryPoint).GUID = _containerCache.NodeLinks[0].BaseNodeGUID; 
           
           foreach(var node in AttributeNodes)
           {
               if (node.EntryPoint) continue;
               Edges.Where(x => x.input.node == node).ToList()
                    .ForEach(edge => _targetGraphView.RemoveElement(edge));  
           
                _targetGraphView.RemoveElement(node); 
           } 

           foreach(var node in CrewMemberNodes)
           {
               if (node.EntryPoint) continue; 
               Edges.Where(x => x.input.node == node).ToList()
                .ForEach(edge => _targetGraphView.RemoveElement(edge)); 

                _targetGraphView.RemoveElement(node); 
           }

           foreach(var node in TraitNodes)
           {
               if (node.EntryPoint) continue;
               Edges.Where(x => x.input.node == node).ToList()
                .ForEach (edge => _targetGraphView.RemoveElement(edge));

                _targetGraphView.RemoveElement(node);                     
           }

           foreach (var node in AnswerNodes)
           {
               if (node.EntryPoint) continue; 
               Edges.Where(x => x.input.node == node).ToList()
               .ForEach(edge => _targetGraphView.RemoveElement(edge)); 

               _targetGraphView.RemoveElement(node); 
           }
        }

        private NodeProperties FindTargetNode(string targetNodeGUID)
        {
            NodeProperties node = new NodeProperties(); 

            node = Nodes.FirstOrDefault(x => x.GUID == targetNodeGUID); 

            if (node == default)
                node = AttributeNodes.FirstOrDefault(x => x.GUID == targetNodeGUID);
            
            if (node == default)
                node = TraitNodes.FirstOrDefault(x => x.GUID == targetNodeGUID); 

            if (node == default)
                node = CrewMemberNodes.FirstOrDefault(x => x.GUID == targetNodeGUID); 

            if (node == default)
                node = AnswerNodes.FirstOrDefault(x => x.GUID == targetNodeGUID); 

            return node; 
        }


        public List<DialogueNode> GetDialogueNodes()
        {
            List<DialogueNode> tempList = new List<DialogueNode>();

            foreach(var node in _targetGraphView.nodes.ToList())
            {
                if (node is DialogueNode)
                    tempList.Add(node as DialogueNode); 
            }

            return tempList; 
        }

        public List<AttributeNode> GetAttributeNodes()
        {
            List<AttributeNode> tempList = new List<AttributeNode>();

            foreach(var node in _targetGraphView.nodes.ToList())
            {
                if (node is AttributeNode)
                    tempList.Add(node as AttributeNode); 
            }

            return tempList; 
        }

        public List<TraitNode> GetTraitNodes()
        {
            List<TraitNode> tempList = new List<TraitNode>();

            foreach(var node in _targetGraphView.nodes.ToList())
                if (node is TraitNode)
                    tempList.Add(node as TraitNode); 
            
            return tempList; 
        }


        public List <CrewMemberNode> GetCrewMemberNodes()
        {
            List<CrewMemberNode> tempList = new List<CrewMemberNode>();

            foreach(var node in _targetGraphView.nodes.ToList())
                if (node is CrewMemberNode)
                    tempList.Add(node as CrewMemberNode); 
            
            return tempList;
        }

        public List<AnswerNode> GetAnswerNodes()
        {
            List<AnswerNode> tempList = new List<AnswerNode>();

            foreach (var node in _targetGraphView.nodes.ToList())
                if (node is AnswerNode)
                    tempList.Add(node as AnswerNode);
            
            return tempList; 
        }

        public List<EndNode> GetEndNodes()
        {
            List<EndNode> tempList = new List<EndNode>();

            foreach (var node in _targetGraphView.nodes.ToList())
                if (node is EndNode)
                    tempList.Add(node as EndNode); 

            return tempList;              
        }

    #endif

    }
}
