using UnityEngine;
# if UNITY_EDITOR 
using UnityEditor.Experimental.GraphView;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine.UIElements;
#endif

namespace Anchry.Dialogue
{
# if UNITY_EDITOR 

    [CreateAssetMenu(fileName = "NodeSearchWindow", menuName = "DialogueSystem/NodeSearchWindow", order = 0)]
    public class NodeSearchWindow : ScriptableObject, ISearchWindowProvider
    {
        private DialogueGraphView _graphView; 
        private EditorWindow _window; 
        private Texture2D _indentationIcon; 

        public void Init(EditorWindow window, DialogueGraphView graphView)
        {
            _graphView = graphView; 
            _window = window; 

            _indentationIcon = new Texture2D (1,1); 
            _indentationIcon.SetPixel(0,0, new Color(0,0,0,0));
            _indentationIcon.Apply(); 
        }

        public List<SearchTreeEntry> CreateSearchTree(SearchWindowContext context)
        {
            var tree = new List<SearchTreeEntry>
            {
                new SearchTreeGroupEntry(new GUIContent("Create Elemenst"),0),
                new SearchTreeGroupEntry(new GUIContent("Dialogue Node"),1), 
                new SearchTreeEntry(new GUIContent("Dialogue Node", _indentationIcon))
                {
                    userData = new DialogueNode(), level = 2
                }, 
                // new SearchTreeEntry(new GUIContent("Attribute Node", _indentationIcon))
                // {
                //     userData = new AttributeNode(), level = 2
                // }, 
                new SearchTreeEntry(new GUIContent("Trait Node", _indentationIcon))
                {
                    userData = new TraitNode(), level = 2
                }, 
                new SearchTreeEntry(new GUIContent("Crew Node", _indentationIcon))
                {
                    userData = new CrewMemberNode(), level = 2
                },
                new SearchTreeEntry(new GUIContent("Answer Node", _indentationIcon))
                {
                    userData = new AnswerNode(), level = 2
                }
            }; 
            return tree; 
        }

        public bool OnSelectEntry(SearchTreeEntry SearchTreeEntry, SearchWindowContext context)
        {
            var worldMousePosition = _window.rootVisualElement.ChangeCoordinatesTo(_window.rootVisualElement.parent, 
                context.screenMousePosition - _window.position.position); 
            var localMousePosition = _graphView.contentViewContainer.WorldToLocal(worldMousePosition); 

            switch(SearchTreeEntry.userData)
            {
                case DialogueNode dialogueNode: 
                    _graphView.GenerateDialogueNode("Dialogue Node", localMousePosition); 
                    return true;  
                case AttributeNode attributeNode:
                    _graphView.GenerateAttributeNode("Attribute Node", localMousePosition); 
                    return true; 
                case TraitNode traitNode:
                    _graphView.GenerateTraitNode("Trait Node", localMousePosition); 
                    return true;
                case CrewMemberNode crewMemberNode:
                    _graphView.GenerateCrewNode("Crew Node", localMousePosition);
                    return true; 
                case AnswerNode answerNode:
                    _graphView.GenerateAnswerNode("Answer Node", localMousePosition); 
                    return true; 
                default:
                    return false;
            }
        }
    }
#endif

}

