using System.Net.Mime;
using System.IO.Compression;
using System.Runtime.ExceptionServices;
using System;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;
using Photon.Pun; 

public class InventoryManager
{
    public InventoryItem[] Items;
    public List<int> PlayerItems = new List<int>(); 
    public List<int> fakeItem = new List<int>(); 


    public void GivePlayerItem(int id )
    {
        //InventoryItem item = Items.FirstOrDefault(c => c.Id == id);

       /* if (item == default)
        {
            Debug.LogError($"Item with {id} does not exist"); 
            return; 
        }

        if (PlayerItems.Contains(item))
        {
            Debug.LogError($"Player Already has {item.ItemName}"); 
        } */

       
        if (!PlayerItems.Contains(id))
            PlayerItems.Add(id); 
    } 


    public void CheckForWin(PlayerController player)
    {
        if (PlayerItems.Count == 4)
        {
            player.RemovePlayer();
            PhotonNetwork.LoadLevel("EndGame"); 
        }

    }

    public bool HasItem(int id)
    {
        //InventoryItem item = PlayerItems.FirstOrDefault(c => c.Id == id); 
        return PlayerItems.Contains(id);

        
    }
}

[Serializable]
public class InventoryItem 
{
    public int Id;
    public string ItemName;  
    public Sprite ItemPic; 
}
