using System.Runtime.InteropServices;
using System;
using System.Collections.Generic;
using System.Linq;
using Anchry.Dialogue;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement; 
using TMPro; 

public class Dialogue : MonoBehaviour
{
    public static Dialogue Instance; 
    public GameObject ConversationObject; 
    private DialogueContainer _currentDialogue; 
    public TMP_Text MainText;
    public TMP_Text NameText;
    public Image Portrait; 
    public Transform AnswerContainer; 
    public GameObject Answer;
    public AudioSource Source; 
    public bool ActiveDialogue => ConversationObject.activeSelf; 
    private List<Button> ActiveAnswers = new List<Button>();

    [Header("Debug")]
    public DialogueContainer TestContainer; 

    private PlayerController _currPlayer; 

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

    void Start()
    {
        DontDestroyOnLoad(this.gameObject); 
    }

    [ContextMenu("Test Dialogue")]
    public void TestDialogue()
    {
        // StartDialogue(TestContainer); 
    }

    public void StartDialogue(DialogueContainer dialogue, PlayerController player, string characterName, Sprite characterPortrait = null)
    {
        _currentDialogue = dialogue; 
        NameText.text = characterName; 

        if (characterPortrait != null)
        {
            Portrait.sprite = characterPortrait; 
            Portrait.enabled = true; 
        }
        else 
            Portrait.enabled = false; 

        player.SetMovement(false); 
        _currPlayer = player; 

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
                break;
            case NodeTypes.AnswerNode:
                CheckAnswerNode(Guid);
                break; 
            case NodeTypes.TraitNode:
                //End Game
                SceneManager.LoadScene("Credits");
                break;
            case NodeTypes.CrewNode:
                // CheckSpeaker(Guid);
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

        print ($"Node data id = {nodeData.AnswerNodeID}"); 

        switch(nodeData.AnswerNodeID)
        {
            case 4:
                //Give Item
                _currPlayer.Inventory.GivePlayerItem(nodeData.AnswerNodeValue); 
                break;
            case 5:
                //Give fake item
                _currPlayer.Inventory.fakeItem.Add(nodeData.AnswerNodeValue); 
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

    public void EndDialogue()
    {
        ConversationObject.SetActive(false); 
        MainText.text = ""; 

        // PlayerController.Instance.TurnOnMovement();

        _currPlayer.Inventory.CheckForWin(_currPlayer);

        _currPlayer.SetMovement(true); 
        _currPlayer = null; 

        for(int i = 0; i < ActiveAnswers.Count; i++)
            Destroy(ActiveAnswers[i].gameObject); 
        
        ActiveAnswers.Clear();
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
            answerButton.GetComponentInChildren<TMP_Text>().text = message; 
            answerButton.onClick.AddListener(delegate{NextDialogue(answer.TargetNodeGUID);});  
            ActiveAnswers.Add(answerButton); 
        }

    }

    private bool CanShowAnswer(NodeLinkData answer)
    {
        AnswerNodeData node = _currentDialogue.AnswerNodeDatas.FirstOrDefault(x => x.NodeGUID == answer.TargetNodeGUID);

        if (node == default) return true; 

        if (node.AnswerNodeID >= 5)
            return true; 

        switch(node.AnswerNodeID)
        {
            case 0: 
                //Check if has fakeItem and return accordingly
                return _currPlayer.Inventory.fakeItem.Contains(node.AnswerNodeValue); 
                // return true; 
            case 1:
                Debug.Log("Checking if has item"); 
                return _currPlayer.Inventory.HasItem(node.AnswerNodeValue);
            case 2:
                //Check if has Trait and return accordingly
                break; 
            case 3:
                return true; 
            case 4: 
                //Check if already has item. 
                return !_currPlayer.Inventory.HasItem(node.AnswerNodeValue);
        }

        return false; 
    }
}
