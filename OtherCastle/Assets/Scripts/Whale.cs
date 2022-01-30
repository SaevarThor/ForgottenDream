using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Whale : MonoBehaviour
{
   public Transform[] movePos; 

   public float Speed; 
   public float RotSpeed; 

   private AudioSource _source; 
   private float _randomTimerMin = 40; 
   private float _randomTimerMax = 120; 
   private float _timer; 


   private Transform _currentWayPoint; 

   private void Start() 
   {
       _currentWayPoint = movePos[Random.Range(0, movePos.Length)]; 
       _source = GetComponent<AudioSource>();

       _timer = Random.Range(_randomTimerMin, _randomTimerMax); 

   }

   private void Update() 
   {
        transform.Translate(Vector3.forward * Speed); 

        Vector3 newDirection = Vector3.RotateTowards(transform.forward,_currentWayPoint.position - transform.position, RotSpeed * Time.deltaTime , 0f);

        transform.rotation = Quaternion.LookRotation(newDirection); 

        if (Vector3.Distance(transform.position, _currentWayPoint.position) < 5 )
            _currentWayPoint = movePos[Random.Range(0, movePos.Length)]; 

        _timer -= Time.deltaTime; 

        if (_timer < 0)
        {
            _source.Play();
            _timer = Random.Range(_randomTimerMin, _randomTimerMax); 
        }

   }
}
