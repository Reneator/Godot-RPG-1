using System.Collections;
using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;
using UnityEngine.Experimental.UIElements;
using UnityEngine.UI;

public class Player : MonoBehaviour
{

    public int speed = 1;
    public Text velocityText;
    public Text inputAxisText;
    private Rigidbody2D rb2d;
    public GameObject attackSquare;

    public int attackDamage = 10;


    private int slowDownFactor = 2;

    private int _slowDownCounter = 0;

    private int _attackCounter = 0;

    // Start is called before the first frame update
    void Start()
    {
        rb2d = GetComponent<Rigidbody2D>();
    }

    // Update is called once per frame
    void Update()
    {
        ShowVelocity();
        Move();
        RotateToMousePointer();
        Attack();
    }

    private void Attack()
    {
        if (Input.GetMouseButtonDown(0))
        {
            _attackCounter++;
            Debug.Log("Attack!" + _attackCounter);
            SpawnAttackColider();

        }
    }

    private void SpawnAttackColider()
    {
        attackSquare.SetActive(true);
    }

    private void RotateToMousePointer()
    {
        var mouse_pos = Input.mousePosition;
        var player_pos = Camera.main.WorldToScreenPoint(rb2d.position);
        Quaternion newRotationAim = Quaternion.Euler(new Vector3(0, 0,
            Mathf.Atan2(mouse_pos.y - player_pos.y, mouse_pos.x - player_pos.x) * Mathf.Rad2Deg));

        rb2d.transform.rotation = newRotationAim;
    }

    private void FixedUpdate()
    {
    }

    private void ShowVelocity()
    {
        Vector2 velocity = rb2d.velocity;

        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.Append("Velocity: ");
        stringBuilder.Append("X: ");
        stringBuilder.Append(velocity.x);
        stringBuilder.Append("Y: ");
        stringBuilder.Append(velocity.y);

        velocityText.text = stringBuilder.ToString();
    }

    private void ShowInputAxis(float X, float Y)
    {

        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.Append("InputAxis: ");
        stringBuilder.Append("X: ");
        stringBuilder.Append(X);
        stringBuilder.Append("Y: ");
        stringBuilder.Append(Y);

        inputAxisText.text = stringBuilder.ToString();
    }

    private void Move()
    {
        //Store the current horizontal input in the float moveHorizontal.
        float moveHorizontal = Input.GetAxis("Horizontal");

        //Store the current vertical input in the float moveVertical.
        float moveVertical = Input.GetAxis("Vertical");

        bool movementPressed = (moveVertical.CompareTo(0)) != 0 || moveHorizontal.CompareTo(0) != 0;

        ShowInputAxis(moveHorizontal, moveVertical);



        //Use the two store floats to create a new Vector2 variable movement.
        Vector2 movement = new Vector2(moveHorizontal, moveVertical).normalized;


        //Call the AddForce function of our Rigidbody2D rb2d supplying movement multiplied by speed to move our player.
        rb2d.AddForce(movement * speed);



        if (!movementPressed)
        {
            SlowDown();

        }
    }

    private void SlowDown()
    {
        _slowDownCounter++;
//        Debug.Log("Slowing Down"+_slowDownCounter);
        rb2d.velocity = rb2d.velocity * 1 / slowDownFactor;
        rb2d.angularVelocity = rb2d.angularVelocity * 1 / slowDownFactor;
    }

    public void Damage(Enemy enemy)
    {
        enemy.GetDamaged(attackDamage);
       
    }


}
