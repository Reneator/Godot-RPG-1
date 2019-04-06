using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Enemy : MonoBehaviour
{
    private Rigidbody2D rb2d;

    private bool movement = false;
    private int slowDownFactor = 2;
    public int health = 100;

    // Start is called before the first frame update
    void Start()
    {
        rb2d = GetComponent<Rigidbody2D> ();

    }

    // Update is called once per frame
    void Update()
    {
        if (!movement)
        {
            SlowDown();

           
        }
    }
    
    private void SlowDown()
    {
        rb2d.velocity = rb2d.velocity * 1/slowDownFactor;
    }

    public void GetDamaged(int damage)
    {
        health -= damage;
        Debug.Log("Enemy Health: "+health);
    }
}
