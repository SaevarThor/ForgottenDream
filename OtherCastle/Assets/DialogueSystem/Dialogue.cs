using System;
using System.Collections.Generic;
using System.Linq;
using Anchry.Dialogue;
using UnityEngine;
using UnityEngine.UI;

public class Dialogue : MonoBehaviour
{
    public static Dialogue Instance; 
    public GameObject ConversationObject; 
    private DialogueContainer _currentDialogue; 
    // private CharacterAttributes _currentAttributes;
    public Text MainText;
    public Transform AnswerContainer; 
    public GameObject Answer;
    public AudioSource Source; 
    public bool ActiveDialogue => ConversationObject.activeSelf; 

    // public string PlayerName => GameManager.Instance.CurrentPlayer.PlayerName; 
    // public string ShipName => GameManager.Instance.CurrentPlayer.ShipName; 
    
    // [SerializeField] private ActorContainer _actorContainer; 
    // [SerializeField] private Text _characterName; 
    // [SerializeField] private Image _characterImage; 
    private List<Button> ActiveAnswers = new List<Button>();

    [Header("Debug")]
    public DialogueContainer TestContainer; 

    private PlayerController _curPlayer; 

    public enum NodeTypes
    {
        DialougeNode, 
        AttributeNode,
        AnswerNode,
        CrewNode,
        TraitNode
    }

	private void Awake() 
	{
		if (Instance != null && Instance != this)
			Destroy(this); 
		else 
			Instance = this; 	
	}

    [ContextMenu("Test Dialogue")]
    public void TestDialogue()
    {
        // StartDialogue(TestContainer); 
    }

    public void StartDialogue(DialogueContainer dialogue, PlayerController player)
    {
        player.SetMovement(false); 

        _curPlayer = player; 

        _currentDialogue = dialogue; 

        ConversationObject.SetActive(true); 
        NextDialogue(_currentDialogue.NodeLinks[0].TargetNodeGUID);  
    }

    private void StartTestDialogue()
    {
        ConversationObject.SetActive(true); 
        NextDialogue(_currentDialogue.NodeLinks[0].TargetNodeGUID); 
    }

    private void NextDialogue(string Guid)
    {
        NodeTypes node = GetNodeType(Guid); 
        bool isAttribute = IsAttributeNode(Guid);

        switch(node)
        {
            case NodeTypes.DialougeNode:
                SetDialogue(Guid); 
                break; 
            case NodeTypes.AttributeNode:
                // RollAttribute(Guid); 
                break;
            case NodeTypes.AnswerNode:
                CheckAnswerNode(Guid);
                break; 
            case NodeTypes.TraitNode:
                CheckPlayerTrait(Guid); 
                break;
            case NodeTypes.CrewNode:
                CheckSpeaker(Guid);
                break; 
        }
    }

    private void CheckSpeaker(string guid)
    {
        string currentSpeaker ="";

        //Find Speaker
        Anchry.Dialogue.NodeLinkData[] Options = _currentDialogue.NodeLinks.Where(t => t.BaseNodeGUID == guid).ToArray();

        foreach (var option in Options)
        {
            if (option.PortName == currentSpeaker)
            {
                NextDialogue(option.TargetNodeGUID); 
                return; 
            }
        }

        Debug.LogError("[Dialogue] Error occured when finding speaker, exiting dialogue"); 
        EndDialogue();
    }

    private void CheckPlayerTrait(string guid)
    {
        TraitNodeData nodeData = _currentDialogue.TraitNodeDatas.FirstOrDefault(x => x.NodeGUID == guid); 
        Anchry.Dialogue.NodeLinkData[] Options = _currentDialogue.NodeLinks.Where(t => t.BaseNodeGUID == guid).ToArray();
        bool hasTrait = false; 

        //Check if player has trait

        if (hasTrait)
            NextDialogue(Options.First(x => x.PortName == "Equipped").TargetNodeGUID);
        else 
            NextDialogue(Options.First(x => x.PortName == "Unequipped").TargetNodeGUID);

    }

    private void CheckAnswerNode(string guid)
    {
        AnswerNodeData nodeData = _currentDialogue.AnswerNodeDatas.FirstOrDefault(x => x.NodeGUID == guid); 
        Anchry.Dialogue.NodeLinkData[] Options; 
        Options = _currentDialogue.NodeLinks.Where(t => t.BaseNodeGUID == guid).ToArray();

        // if (nodeData.AnswerNodeID <= 3)
        //     NextDialogue(Options[0].TargetNodeGUID); 
        
        switch(nodeData.AnswerNodeID)
        {
            case 4:
                //Give Item
                break;
            case 5:
                //Give friend score
                break; 
        }
        NextDialogue(Options[0].TargetNodeGUID); 
    }

    private void SetDialogue(string Guid)
    {
        DialogueNodeData nodeData = _currentDialogue.DialogueNodeDatas.FirstOrDefault(t => t.NodeGUID == Guid); 
        if (!HasAnswers(Guid))
        {
            EndDialogue();
            return; 
        }

        MainText.text = SetUpDialogueUI(nodeData); 
        SetAnswers(Guid); 
    }

    private NodeTypes GetNodeType(string guid)
    {
        if (_currentDialogue.DialogueNodeDatas.FirstOrDefault(x => x.NodeGUID == guid) != default)
            return NodeTypes.DialougeNode;
        else if (_currentDialogue.AnswerNodeDatas.FirstOrDefault(x => x.NodeGUID == guid) != default)
            return NodeTypes.AnswerNode;
        else if (_currentDialogue.AttributeNodeDatas.FirstOrDefault(x => x.NodeGUID == guid) != default)
            return NodeTypes.AttributeNode; 
        else if (_currentDialogue.CrewNodeDatas.FirstOrDefault(x => x.NodeGUID == guid) != default)
            return NodeTypes.CrewNode;
        else if (_currentDialogue.TraitNodeDatas.FirstOrDefault(x => x.NodeGUID == guid) != default)
            return NodeTypes.TraitNode;

        Debug.LogError("[Dialogue] couldn't fing GUID exiting dialogue");
        EndDialogue();

        return NodeTypes.DialougeNode; 
    }

    // private void RollAttribute(string GUID)
    // {
    //     var nodeData = _currentDialogue.AttributeNodeDatas.First(x => x.NodeGUID == GUID); 
    //     // int attributeValue = TranslateAttribute(nodeData.AttributeID); 

    //     Anchry.Dialogue.NodeLinkData[] Options; 
    //     Options = _currentDialogue.NodeLinks.Where(t => t.BaseNodeGUID == GUID).ToArray();
        
    //     int roll = UnityEngine.Random.Range(1,100); 

    //     if (roll > attributeValue)
    //     {
    //         NextDialogue(Options.First(x => x.PortName == "Fail").TargetNodeGUID); 
    //     } else 
    //         NextDialogue(Options.First(x => x.PortName == "Success").TargetNodeGUID); 

    // }

    // private int TranslateAttribute(int attributeID)
    // {
    //     switch(attributeID)
    //     {
    //         case 0:
    //             return _currentAttributes.Strength; 
    //         case 1:
    //             return _currentAttributes.Dexterety; 
    //         case 2: 
    //             return _currentAttributes.Size; 
    //         case 3:
    //             return _currentAttributes.Constitution; 
    //         case 4:
    //             return _currentAttributes.Appearance;
    //         case 5:
    //             return _currentAttributes.MentalPower; 
    //         case 6:
    //             return _currentAttributes.Intelligence; 
    //     }

    //     return -1; 
    // }

    private bool IsAttributeNode(string GUID)
    {
        if (_currentDialogue.AttributeNodeDatas.FirstOrDefault(x => x.NodeGUID == GUID) != default)
            return false; 
        else 
            return true; 
    }

    private bool HasAnswers(string guid)
    {
        foreach(var node in _currentDialogue.NodeLinks)
        {
            if (node.BaseNodeGUID == guid)
                return true;
        }
        return false; 
    }

    private void EndDialogue()
    {
        ConversationObject.SetActive(false); 
        MainText.text = ""; 

        _curPlayer.SetMovement(true); 

        for(int i = 0; i < ActiveAnswers.Count; i++)
            Destroy(ActiveAnswers[i].gameObject); 
   }

    private string SetUpDialogueUI(DialogueNodeData nodeData)
    {
        // DialogueNodeData nodeData = _currentDialogue.DialogueNodeDatas.FirstOrDefault(t => t.NodeGUID == Guid); 

        // Actor actor = _actorContainer.Actors.First(t => t.ActorID == nodeData.ActorID); 

        // _characterImage.sprite = actor.ActorImage; 
        // _characterName.text = actor.ActorName;

        return string.Format(nodeData.DialogueText); 
    }

    private void SetAnswers(string Guid)
    {
        for(int i = 0; i < ActiveAnswers.Count; i++)
        {
            if (ActiveAnswers[i] == null) continue; 
            Destroy(ActiveAnswers[i].gameObject); 
        }

        ActiveAnswers.Clear();
        Anchry.Dialogue.NodeLinkData[] AnswerArray; 
        AnswerArray = _currentDialogue.NodeLinks.Where(t => t.BaseNodeGUID == Guid).ToArray();

        foreach(var answer in AnswerArray)
        {
            if (!CanShowAnswer(answer)) continue; 

            string message = answer.PortName;
            Button answerButton = Instantiate(Answer, transform.position, Quaternion.identity, AnswerContainer).GetComponent<Button>();
            answerButton.GetComponentInChildren<Text>().text = message; 
            answerButton.onClick.AddListener(delegate{NextDialogue(answer.TargetNodeGUID);});  
            ActiveAnswers.Add(answerButton); 
        }

    }

    private bool CanShowAnswer(NodeLinkData answer)
    {
        AnswerNodeData node = _currentDialogue.AnswerNodeDatas.FirstOrDefault(x => x.NodeGUID == answer.TargetNodeGUID);

        if (node == default) return true; 

        if (node.AnswerNodeID >= 4)
            return true; 

        switch(node.AnswerNodeID)
        {
            case 0: 
                //Check if has friendscore and return accordingly
                break; 
            case 1:
                //Check if has Item and return accordingly
                break;
            case 2:
                //Check if has Trait and return accordingly
                break; 
        }

        return false; 
    }
}
