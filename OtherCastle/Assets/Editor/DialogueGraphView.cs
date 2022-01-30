using System.Net.Mime;
using System.Linq;
using System;
using System.Collections.Generic;
using UnityEngine;
# if UNITY_EDITOR 
using UnityEditor.Experimental.GraphView; 
using UnityEngine.UIElements;
using UnityEditor;
#endif
using UnityEditor.UIElements;

namespace Anchry.Dialogue
{
# if UNITY_EDITOR 

    public class DialogueGraphView : GraphView
    {
        public readonly Vector2 DefaultNodeSize = new Vector2(150, 200);
        public Blackboard Blackboard;
        public List<ExposedProperty> ExposedProperties = new List<ExposedProperty>();
        private NodeSearchWindow _searchWindow; 
        private bool showFoldOut = false;
        private DialougeEnum _graphEnums = new DialougeEnum();

        public DialogueGraphView(EditorWindow window)
        {
            styleSheets.Add(Resources.Load<StyleSheet>("DialogueGraph")); 
            SetupZoom(ContentZoomer.DefaultMinScale, ContentZoomer.DefaultMaxScale);

            this.AddManipulator(new ContentDragger()); 
            this.AddManipulator(new SelectionDragger()); 
            this.AddManipulator(new RectangleSelector()); 

            var grid = new GridBackground();
            Insert(0,grid); 
            grid.StretchToParentSize();

            AddElement(GenerateEntryPointNode()); 
            AddSearchWindow(window);
        }

        public override List<Port> GetCompatiblePorts(Port startPort, NodeAdapter nodeAdapter)
        {
            var compatiblePorts = new List<Port>(); 

            ports.ForEach(port => 
            {
                if (startPort != port && startPort.node != port.node)
                    compatiblePorts.Add(port); 
            });
            return compatiblePorts; 
        }

        private Port GeneratePort(Node node, Direction portDirection, Port.Capacity capacity = Port.Capacity.Single)
        {
            // Port port = node.InstantiatePort(Orientation.Horizontal, portDirection, capacity, typeof(float)); 

            // DialoguePort dPort = new DialoguePort(port.orientation, port.direction, port.capacity, typeof(float)); 

            // return dPort; 
            return node.InstantiatePort(Orientation.Horizontal, portDirection, capacity, typeof(float)); 
        }

        private DialogueNode GenerateEntryPointNode()
        {
            var node = new DialogueNode
            {
                title = "START", 
                GUID = Guid.NewGuid().ToString(),
                DialogueText = "ENTRYPOINT",
                EntryPoint = true
            }; 

            var generatedPort = GeneratePort(node, Direction.Output); 
            generatedPort.portName = "First Node"; 
            node.outputContainer.Add(generatedPort); 

            node.styleSheets.Add(Resources.Load<StyleSheet>("EntryNode"));

            node.capabilities &= ~Capabilities.Movable;
            node.capabilities &= ~Capabilities.Deletable; 

            node.RefreshExpandedState();
            node.RefreshPorts();

            node.SetPosition(new Rect(400,200,100,150)); 
            return node; 
        }

        public void ClearBlackBoardAndExposedProperties()
        {
            ExposedProperties.Clear();
            Blackboard.Clear();
        }

        public void AddPropertyToBlackBoard(ExposedProperty exposedProperty)
        {
            var localPropertyName = exposedProperty.PropertyName; 
            var localPropertyValue = exposedProperty.PropertyValue;

            while (ExposedProperties.Any(x => x.PropertyName == localPropertyName))
                localPropertyName = $"{localPropertyName}(1)"; 

            var property = new ExposedProperty();
            property.PropertyName = localPropertyName; 
            property.PropertyValue = localPropertyValue; 

            ExposedProperties.Add(property); 

            var container = new VisualElement();
            var blackboardField = new BlackboardField{text = property.PropertyName, typeText = "string property"};
            container.Add(blackboardField); 

            var propertyValueTextField = new TextField("Value:")
            {
                value = localPropertyValue
            }; 
            propertyValueTextField.RegisterValueChangedCallback(evt => 
            {
                var changingPropertyIndex = ExposedProperties.FindIndex(x => x.PropertyName == property.PropertyName); 
                ExposedProperties[changingPropertyIndex].PropertyValue = evt.newValue; 
            });
            var blackBoardValueRow = new BlackboardRow(blackboardField, propertyValueTextField); 
            container.Add(blackBoardValueRow); 

            Blackboard.Add(container); 
        }

        public void GenerateAttributeNode(string nodeName, Vector2 mousePosition)
        {
            AddElement(CreateAttributeNode(nodeName, mousePosition)); 
        }

        public void GenerateTraitNode(string nodeName, Vector2 mousePosition) 
            => AddElement(CreateTraitNode(nodeName, mousePosition));

        public TraitNode CreateTraitNode(string nodeName, Vector2 mousePosition, int traitID = -1)
        {
            var traitNode = new TraitNode
            {
                title = nodeName,
                GUID = Guid.NewGuid().ToString()
            }; 

            var inputPort = GeneratePort(traitNode, Direction.Input, Port.Capacity.Multi); 
            inputPort.portName = "Input"; 
            traitNode.inputContainer.Add(inputPort); 

            //TODO: Create special style sheet for new node
            traitNode.styleSheets.Add(Resources.Load<StyleSheet>("Node")); 

            //Generate success port
            var equippedPort = GeneratePort(traitNode, Direction.Output); 
            var equippedPortOldLabel = equippedPort.contentContainer.Q<Label>("type"); 
            equippedPort.contentContainer.Remove(equippedPortOldLabel); 
            string equippedPortName = "Equipped"; 

            var successTextField = new TextField
            {
                name = string.Empty,
                value = equippedPortName,
                focusable = false
            }; 

            equippedPort.contentContainer.Add(new Label("  ")); 
            equippedPort.contentContainer.Add(successTextField); 

            //Generate fail port
            var negativePort = GeneratePort(traitNode, Direction.Output); 
            var negativePortOldLabel = negativePort.contentContainer.Q<Label>("type"); 
            negativePort.contentContainer.Remove(negativePortOldLabel); 
            string negativePortName = "Unequipped"; 
        
            var failTextField = new TextField
            {
                name = string.Empty,
                value = negativePortName,
                focusable = false
            }; 
            negativePort.contentContainer.Add(new Label("  ")); 
            negativePort.contentContainer.Add(failTextField); 

            var dropdown = new EnumField("Trait", _graphEnums.Traits);
            dropdown.RegisterValueChangedCallback(evt => 
            {
                traitNode.TranslateTraitString(evt.newValue.ToString());
            });
            if (traitID != -1)
            {
                _graphEnums.Traits = (DialougeEnum.PlayerTrait)traitID; 
                traitNode.TranslateTraitString(_graphEnums.Traits.ToString()); 
                dropdown.Init(_graphEnums.Traits); 
            }
            traitNode.mainContainer.Add(dropdown); 

            equippedPort.portName = equippedPortName; 
            negativePort.portName = negativePortName; 
            traitNode.outputContainer.Add(equippedPort); 
            traitNode.outputContainer.Add(negativePort); 
            traitNode.RefreshPorts();
            traitNode.RefreshExpandedState();
            traitNode.SetPosition(new Rect(mousePosition, DefaultNodeSize)); 

            return traitNode; 
        }

        public void GenerateCrewNode(string nodeName, Vector2 mousePosition)
            => AddElement(CreateCrewNode(nodeName, mousePosition));

        public CrewMemberNode CreateCrewNode (string nodeName, Vector2 mousePosition)
        {
            var crewNode = new CrewMemberNode
            {
                title = nodeName,
                GUID = Guid.NewGuid().ToString()
            }; 

            var inputPort = GeneratePort(crewNode, Direction.Input, Port.Capacity.Multi);
            inputPort.portName = "Input"; 
            crewNode.inputContainer.Add(inputPort); 

            crewNode.styleSheets.Add(Resources.Load<StyleSheet>("Node")); 

            string[] crewNames = System.Enum.GetNames(typeof(DialougeEnum.Crew));
            for (int i = 0; i < crewNames.Length; i++)
            {
                var crewPort = GeneratePort(crewNode, Direction.Output); 
                var oldLabel = crewPort.contentContainer.Q<Label>("type"); 
                crewPort.contentContainer.Remove(oldLabel); 

                var portField = new TextField
                {
                    name = string.Empty,
                    value = crewNames[i],
                    focusable = false
                };

                crewPort.contentContainer.Add(new Label("   ")); 
                crewPort.contentContainer.Add(portField); 

                crewPort.portName = crewNames[i]; 

                crewNode.outputContainer.Add(crewPort); 
            }

            crewNode.RefreshPorts();
            crewNode.RefreshExpandedState();
            crewNode.SetPosition(new Rect(mousePosition, DefaultNodeSize));
            return crewNode; 
        }


        public AttributeNode CreateAttributeNode(string nodeName, Vector2 mousePosition, int attributeID = -1)
        {
            var attributeNode = new AttributeNode
            {
                title = nodeName,
                GUID = Guid.NewGuid().ToString()
            }; 

            var inputPort = GeneratePort(attributeNode, Direction.Input, Port.Capacity.Multi); 
            inputPort.portName = "Input"; 
            attributeNode.inputContainer.Add(inputPort); 

            //TODO: Create special style sheet for new node
            attributeNode.styleSheets.Add(Resources.Load<StyleSheet>("Node")); 

            //Generate success port
            var successPort = GeneratePort(attributeNode, Direction.Output); 
            var successPortOldLabel = successPort.contentContainer.Q<Label>("type"); 
            successPort.contentContainer.Remove(successPortOldLabel); 
            string successPortName = "Success"; 

            var successTextField = new TextField
            {
                name = string.Empty,
                value = successPortName,
                focusable = false
            }; 

            successPort.contentContainer.Add(new Label("  ")); 
            successPort.contentContainer.Add(successTextField); 

            //Generate fail port
            var failPort = GeneratePort(attributeNode, Direction.Output); 
            var failPortOldLabel = failPort.contentContainer.Q<Label>("type"); 
            failPort.contentContainer.Remove(failPortOldLabel); 
            string failPortName = "Fail"; 
        
            var failTextField = new TextField
            {
                name = string.Empty,
                value = failPortName,
                focusable = false
            }; 
            failPort.contentContainer.Add(new Label("  ")); 
            failPort.contentContainer.Add(failTextField); 

            var dropdown = new EnumField("Attribute", _graphEnums.AllAttributes);
            dropdown.RegisterValueChangedCallback(evt => 
            {
                attributeNode.TranslateAttributeString(evt.newValue.ToString());
            });
            if (attributeID != -1)
            {
                _graphEnums.AllAttributes = (DialougeEnum.Attribute)attributeID; 
                dropdown.Init(_graphEnums.AllAttributes); 
            }
            attributeNode.mainContainer.Add(dropdown); 

            successPort.portName = successPortName; 
            failPort.portName = failPortName; 
            attributeNode.outputContainer.Add(successPort); 
            attributeNode.outputContainer.Add(failPort); 
            attributeNode.RefreshPorts();
            attributeNode.RefreshExpandedState();
            attributeNode.SetPosition(new Rect(mousePosition, DefaultNodeSize)); 

            return attributeNode; 
        }

        public void GenerateDialogueNode(string nodeName, Vector2 mousePosition)
        {
            AddElement(CreateDialogueNode(nodeName, mousePosition)); 
        }

        public DialogueNode CreateDialogueNode(string nodeName, Vector2 position, bool isEndNode = false)
        {
            var dialogueNode = new DialogueNode
            {
                title = nodeName, 
                DialogueText = nodeName, 
                GUID = Guid.NewGuid().ToString()
            };

            var inputPort = GeneratePort(dialogueNode, Direction.Input, Port.Capacity.Multi); 
            inputPort.portName = "Input"; 
            dialogueNode.inputContainer.Add(inputPort); 

            dialogueNode.styleSheets.Add(Resources.Load<StyleSheet>("Node")); 

            var button = new Button(() => {AddChoicePort(dialogueNode);}); 
            button.text = "New Choice"; 
            dialogueNode.titleContainer.Add(button); 
            
            // var actorID = new IntegerField("Add Actor GUID"); 
            // actorID.RegisterValueChangedCallback(evt => 
            // {
            //     dialogueNode.ActorIndex = evt.newValue; 
            // });
            // dialogueNode.inputContainer.Add(actorID); 
            
            var textField = new TextField(string.Empty);
            textField.RegisterValueChangedCallback(evt => 
            {
                dialogueNode.DialogueText = evt.newValue;
                dialogueNode.title = evt.newValue;
            }); 
            textField.SetValueWithoutNotify(dialogueNode.title); 
            dialogueNode.mainContainer.Add(textField); 

            // var boolField = new Toggle("Is End Node");
            // boolField.RegisterValueChangedCallback(evt => 
            // {
            //     dialogueNode.IsEndNode = evt.newValue; 
            // }); 
            // dialogueNode.inputContainer.Add(boolField); 
            // boolField.value = isEndNode; 
            // dialogueNode.IsEndNode = isEndNode; 

            dialogueNode.RefreshExpandedState();
            dialogueNode.RefreshPorts();
            dialogueNode.SetPosition(new Rect(position, DefaultNodeSize));

            return dialogueNode; 
        }

        public void GenerateAnswerNode(string nodeName, Vector2 mousePosition)
        {
            AddElement(CreateAnswerNode(nodeName, mousePosition)); 
        }

        public AnswerNode CreateAnswerNode(string nodeName, Vector2 mousePosition, int id = -1, int value = -1)
        {
            var answerNode = new AnswerNode
            {
                title = nodeName,
                GUID = Guid.NewGuid().ToString()
            };

            var inputPort = GeneratePort(answerNode, Direction.Input, Port.Capacity.Multi); 
            inputPort.portName = "Input"; 
            answerNode.inputContainer.Add(inputPort); 

            //TODO: Create special style sheet for new node
            answerNode.styleSheets.Add(Resources.Load<StyleSheet>("Node")); 

            var dropdown = new EnumField("Answer Type", _graphEnums.Answer);
            dropdown.RegisterValueChangedCallback(evt => 
            {
                answerNode.TranslateAnswerData(evt.newValue.ToString());
            });
            if (id != -1)
            {
                _graphEnums.Answer = (DialougeEnum.AnswerEnum)id; 
                answerNode.TranslateAnswerData(_graphEnums.Answer.ToString()); 
                dropdown.Init(_graphEnums.Answer); 
            }
            answerNode.extensionContainer.Add(dropdown); 

            var valueField = new IntegerField("Value");
            valueField.RegisterValueChangedCallback(evt => 
            {
                answerNode.AnswerValue = evt.newValue;
            });
            if (value != -1)
            {
                valueField.value = value; 
                answerNode.AnswerValue = value; 
                Debug.Log($"setting value {value}"); 
            }

            answerNode.extensionContainer.Add(valueField);

            var answerPort = GeneratePort(answerNode, Direction.Output); 
            var oldLabel = answerPort.contentContainer.Q<Label>("type"); 
            answerPort.contentContainer.Remove(oldLabel); 

            var portField = new TextField
            {
                name = string.Empty,
                value = "output",
                focusable = false
            };

            answerPort.contentContainer.Add(new Label("   ")); 
            answerPort.contentContainer.Add(portField); 

            answerPort.portName = "output"; 

            answerNode.outputContainer.Add(answerPort); 

            answerNode.RefreshExpandedState();
            answerNode.RefreshPorts();
            answerNode.SetPosition(new Rect(mousePosition, DefaultNodeSize));

            return answerNode; 
        }

        public void AddChoicePort(NodeProperties dialogueNode, string overriddenPortName = "")
        {
            var generatedPort = GeneratePort(dialogueNode, Direction.Output); 

            var oldLabel = generatedPort.contentContainer.Q<Label>("type"); 
            generatedPort.contentContainer.Remove(oldLabel);

            var outputPortCount = dialogueNode.outputContainer.Query("connector").ToList().Count; 

            var choicePortName = string.IsNullOrEmpty(overriddenPortName) ? 
                $"Choice {outputPortCount + 1}" : overriddenPortName; 

            var textField = new TextField
            {
                name = string.Empty,
                value = choicePortName
            }; 
            textField.RegisterValueChangedCallback(evt => generatedPort.portName = evt.newValue); 
            generatedPort.contentContainer.Add(new Label("  ")); 
            generatedPort.contentContainer.Add(textField); 
            var deleteButton = new Button(() => RemovePort(dialogueNode, generatedPort))
            {
                text = "X"
            }; 

            generatedPort.contentContainer.Add(deleteButton); 

            generatedPort.portName = choicePortName; 
            dialogueNode.outputContainer.Add(generatedPort); 
            dialogueNode.RefreshPorts();
            dialogueNode.RefreshExpandedState();
        }

        private void RemovePort(NodeProperties dialogueNode, Port generatedPort)
        {
            var targetEdge = edges.ToList().Where(x => 
                x.output.portName == generatedPort.portName && x.output.node == generatedPort.node);
             
            if (targetEdge.Any())
            {
                var edge = targetEdge.First();
                edge.input.Disconnect(edge); 
                RemoveElement(targetEdge.First()); 
            }

            dialogueNode.outputContainer.Remove(generatedPort); 
            dialogueNode.RefreshPorts();
            dialogueNode.RefreshExpandedState();
        }
        private void AddSearchWindow(EditorWindow window)
        {
            _searchWindow = ScriptableObject.CreateInstance<NodeSearchWindow>();
            _searchWindow.Init(window, this); 
            nodeCreationRequest = context => SearchWindow.Open(new SearchWindowContext(context.screenMousePosition), _searchWindow); 
        }
    }
#endif

}
