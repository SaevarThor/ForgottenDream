using System.Net.Mime;
using System.IO.Compression;
using System.Runtime.ExceptionServices;
using System;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;

public class InventoryManager
{
    public InventoryItem[] Items;
    public List<InventoryItem> PlayerItems = new List<InventoryItem>(); 
    public List<int> fakeItem = new List<int>(); 


    public void GivePlayerItem(int id )
    {
        InventoryItem item = Items.FirstOrDefault(c => c.Id == id);

        if (item == default)
        {
            Debug.LogError($"Item with {id} does not exist"); 
            return; 
        }

        if (PlayerItems.Contains(item))
        {
            Debug.LogError($"Player Already has {item.ItemName}"); 
        }

        Debug.Log($"{item.ItemName} succesfully added to inventory"); 

        PlayerItems.Add(item); 
    } 

    public bool HasItem(int id)
    {
        // InventoryItem item = Items.FirstOrDefault(c => c.Id == id);

        InventoryItem item = PlayerItems.FirstOrDefault(c => c.Id == id); 

        if (item == default)
            return false; 

        return true; 
    }
}

[Serializable]
public class InventoryItem 
{
    public int Id;
    public string ItemName;  
    public Sprite ItemPic; 
}
