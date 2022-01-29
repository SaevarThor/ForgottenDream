using UnityEngine;
using UnityEngine.UI; 

public class Interaction : MonoBehaviour
{
    private const string InteractibleTag = "Interactible"; 
    [SerializeField] private Camera _camera;
    [SerializeField] private float _range; 

    [Header ("UI Elements")]
    [SerializeField] private Image _image; 
    [SerializeField] private Sprite _crosshair;
    [SerializeField] private Sprite _hand; 
    
    // private KeyCode _interactKey => InputManager.Instance.InteractKey; 
    private bool _canInteract = true; 
    Ray _ray; 

    private void Start()
    {
        //Set up UI 
    }
    

    private void Update()
    {
        if (!_canInteract) return;

        _image.enabled = !Dialogue.Instance.ActiveDialogue;
        
        _ray = _camera.ViewportPointToRay(new Vector3(.5f,.5f,0)); 

        // if (Input.GetKeyDown(_interactKey))
            // Interact();

        //Check for interactible to change UI elements
        RaycastHit hit; 

        if (Physics.Raycast(_ray, out hit, _range))
        {
            if (hit.collider.CompareTag(InteractibleTag))
                _image.sprite = _hand; 
            else
                _image.sprite = _crosshair; 
        } else 
            _image.sprite = _crosshair; 

    }

    public void Interact()
    {
        RaycastHit hit; 

        if (Physics.Raycast(_ray, out hit, _range))
        {
            if (hit.collider.CompareTag(InteractibleTag))
                hit.transform.GetComponent<IInteractible>().Interact();
        }
    }
}
