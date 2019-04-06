using System;
using System.Collections;
using System.Collections.Generic;
using Objects.Level;
using UnityEngine;

public class AttackBox : MonoBehaviour
{
    public double attackDuration = 0.5;
    private List<Enemy> _enemiesHit = new List<Enemy>();
    private DateTime awakeTime;
    private Player player;

    private void Awake()
    {
        Debug.Log("AttackBox woke up!");
        awakeTime = DateTime.Now;
    }

    // Start is called before the first frame update
    void Start()
    {
        player = GetComponentInParent<Player>();
        Debug.Log("AttackBox started!");
    }

    // Update is called once per frame
    void Update()
    {
        if ((DateTime.Now - awakeTime).Seconds > attackDuration)
        {
            Debug.Log("AttackBox put itself back to sleep!");
            _enemiesHit = new List<Enemy>();
            this.gameObject.SetActive(false);
        }
    }

    private void OnEnable()
    {
        awakeTime = DateTime.Now;
    }


    private void OnTriggerEnter2D(Collider2D other)
    {
        if (other.gameObject.CompareTag("Damageable"))
        {
            Enemy enemy = other.GetComponent<Enemy>();

            if (!_enemiesHit.Contains(enemy))
            {
                _enemiesHit.Add(enemy);
                Debug.Log(other.ToString());

                player.Damage(enemy);
            }
        }
    }
}