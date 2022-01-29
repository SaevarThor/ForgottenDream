// GENERATED AUTOMATICALLY FROM 'Assets/InputActions/NormalInputs.inputactions'

using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.InputSystem;
using UnityEngine.InputSystem.Utilities;

public class @PlayerActionControler : IInputActionCollection, IDisposable
{
    public InputActionAsset asset { get; }
    public @PlayerActionControler()
    {
        asset = InputActionAsset.FromJson(@"{
    ""name"": ""NormalInputs"",
    ""maps"": [
        {
            ""name"": ""Normal"",
            ""id"": ""edb47c2c-d4ce-46a3-b529-39b9a7acc8fc"",
            ""actions"": [
                {
                    ""name"": ""Vertical"",
                    ""type"": ""Button"",
                    ""id"": ""a3e30849-5fcd-40f9-9a73-1dd2e8c35dd1"",
                    ""expectedControlType"": ""Button"",
                    ""processors"": """",
                    ""interactions"": """"
                },
                {
                    ""name"": ""Jump"",
                    ""type"": ""PassThrough"",
                    ""id"": ""5b311d0a-b0b2-4eb4-8928-9b9bcc247c9c"",
                    ""expectedControlType"": ""Button"",
                    ""processors"": """",
                    ""interactions"": """"
                },
                {
                    ""name"": ""Interact"",
                    ""type"": ""Button"",
                    ""id"": ""c391595d-688b-4778-b1ad-a19af25b4fe5"",
                    ""expectedControlType"": ""Button"",
                    ""processors"": """",
                    ""interactions"": """"
                },
                {
                    ""name"": ""Horizontal"",
                    ""type"": ""Button"",
                    ""id"": ""48557850-806e-4e6c-b369-1364143e1b41"",
                    ""expectedControlType"": ""Button"",
                    ""processors"": """",
                    ""interactions"": """"
                },
                {
                    ""name"": ""MousePosition"",
                    ""type"": ""PassThrough"",
                    ""id"": ""0225103e-47d6-4de3-b8e0-dbf6e157d43f"",
                    ""expectedControlType"": ""Vector2"",
                    ""processors"": """",
                    ""interactions"": """"
                },
                {
                    ""name"": ""Run"",
                    ""type"": ""Button"",
                    ""id"": ""de2fd4b1-ba80-4afe-8e2f-7e9775b355e4"",
                    ""expectedControlType"": ""Button"",
                    ""processors"": """",
                    ""interactions"": """"
                },
                {
                    ""name"": ""Shoot"",
                    ""type"": ""Button"",
                    ""id"": ""d71d1bb8-b176-42a5-bf9a-88d11ee563ef"",
                    ""expectedControlType"": ""Button"",
                    ""processors"": """",
                    ""interactions"": """"
                }
            ],
            ""bindings"": [
                {
                    ""name"": ""Vertical"",
                    ""id"": ""bb9f4d35-e461-4f3b-af55-d543e4878b57"",
                    ""path"": ""1DAxis(whichSideWins=1)"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Vertical"",
                    ""isComposite"": true,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": ""negative"",
                    ""id"": ""95a92ed5-6614-4f64-a3f7-44fa74d69185"",
                    ""path"": ""<Keyboard>/s"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Vertical"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": true
                },
                {
                    ""name"": ""positive"",
                    ""id"": ""cf9cce01-cded-47f4-8603-182a71dba39c"",
                    ""path"": ""<Keyboard>/w"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Vertical"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": true
                },
                {
                    ""name"": """",
                    ""id"": ""7e91832d-9105-49d2-b188-4caeadbe13cf"",
                    ""path"": ""<Keyboard>/space"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Jump"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": """",
                    ""id"": ""f9c81c3c-df51-4ba6-9f11-d92e37940e4c"",
                    ""path"": ""<Keyboard>/e"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Interact"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": ""1D Axis"",
                    ""id"": ""af200000-bb6f-4b29-a177-20071c3021b1"",
                    ""path"": ""1DAxis"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Horizontal"",
                    ""isComposite"": true,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": ""negative"",
                    ""id"": ""818733a3-c77b-4e7c-8f4a-e92426ce4ab2"",
                    ""path"": ""<Keyboard>/a"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Horizontal"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": true
                },
                {
                    ""name"": ""positive"",
                    ""id"": ""683a6f4a-7949-4680-a656-8e57e7f2ada7"",
                    ""path"": ""<Keyboard>/d"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Horizontal"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": true
                },
                {
                    ""name"": """",
                    ""id"": ""04fa445c-766a-45df-961f-fb1a944809b8"",
                    ""path"": ""<Mouse>/delta"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""MousePosition"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": """",
                    ""id"": ""f095d701-b64f-4349-89df-b4920d55275a"",
                    ""path"": ""<Keyboard>/leftShift"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Run"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": """",
                    ""id"": ""b15512a2-9252-4bc7-8dce-a12e978969b2"",
                    ""path"": ""<Mouse>/leftButton"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Shoot"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                }
            ]
        }
    ],
    ""controlSchemes"": []
}");
        // Normal
        m_Normal = asset.FindActionMap("Normal", throwIfNotFound: true);
        m_Normal_Vertical = m_Normal.FindAction("Vertical", throwIfNotFound: true);
        m_Normal_Jump = m_Normal.FindAction("Jump", throwIfNotFound: true);
        m_Normal_Interact = m_Normal.FindAction("Interact", throwIfNotFound: true);
        m_Normal_Horizontal = m_Normal.FindAction("Horizontal", throwIfNotFound: true);
        m_Normal_MousePosition = m_Normal.FindAction("MousePosition", throwIfNotFound: true);
        m_Normal_Run = m_Normal.FindAction("Run", throwIfNotFound: true);
        m_Normal_Shoot = m_Normal.FindAction("Shoot", throwIfNotFound: true);
    }

    public void Dispose()
    {
        UnityEngine.Object.Destroy(asset);
    }

    public InputBinding? bindingMask
    {
        get => asset.bindingMask;
        set => asset.bindingMask = value;
    }

    public ReadOnlyArray<InputDevice>? devices
    {
        get => asset.devices;
        set => asset.devices = value;
    }

    public ReadOnlyArray<InputControlScheme> controlSchemes => asset.controlSchemes;

    public bool Contains(InputAction action)
    {
        return asset.Contains(action);
    }

    public IEnumerator<InputAction> GetEnumerator()
    {
        return asset.GetEnumerator();
    }

    IEnumerator IEnumerable.GetEnumerator()
    {
        return GetEnumerator();
    }

    public void Enable()
    {
        asset.Enable();
    }

    public void Disable()
    {
        asset.Disable();
    }

    // Normal
    private readonly InputActionMap m_Normal;
    private INormalActions m_NormalActionsCallbackInterface;
    private readonly InputAction m_Normal_Vertical;
    private readonly InputAction m_Normal_Jump;
    private readonly InputAction m_Normal_Interact;
    private readonly InputAction m_Normal_Horizontal;
    private readonly InputAction m_Normal_MousePosition;
    private readonly InputAction m_Normal_Run;
    private readonly InputAction m_Normal_Shoot;
    public struct NormalActions
    {
        private @PlayerActionControler m_Wrapper;
        public NormalActions(@PlayerActionControler wrapper) { m_Wrapper = wrapper; }
        public InputAction @Vertical => m_Wrapper.m_Normal_Vertical;
        public InputAction @Jump => m_Wrapper.m_Normal_Jump;
        public InputAction @Interact => m_Wrapper.m_Normal_Interact;
        public InputAction @Horizontal => m_Wrapper.m_Normal_Horizontal;
        public InputAction @MousePosition => m_Wrapper.m_Normal_MousePosition;
        public InputAction @Run => m_Wrapper.m_Normal_Run;
        public InputAction @Shoot => m_Wrapper.m_Normal_Shoot;
        public InputActionMap Get() { return m_Wrapper.m_Normal; }
        public void Enable() { Get().Enable(); }
        public void Disable() { Get().Disable(); }
        public bool enabled => Get().enabled;
        public static implicit operator InputActionMap(NormalActions set) { return set.Get(); }
        public void SetCallbacks(INormalActions instance)
        {
            if (m_Wrapper.m_NormalActionsCallbackInterface != null)
            {
                @Vertical.started -= m_Wrapper.m_NormalActionsCallbackInterface.OnVertical;
                @Vertical.performed -= m_Wrapper.m_NormalActionsCallbackInterface.OnVertical;
                @Vertical.canceled -= m_Wrapper.m_NormalActionsCallbackInterface.OnVertical;
                @Jump.started -= m_Wrapper.m_NormalActionsCallbackInterface.OnJump;
                @Jump.performed -= m_Wrapper.m_NormalActionsCallbackInterface.OnJump;
                @Jump.canceled -= m_Wrapper.m_NormalActionsCallbackInterface.OnJump;
                @Interact.started -= m_Wrapper.m_NormalActionsCallbackInterface.OnInteract;
                @Interact.performed -= m_Wrapper.m_NormalActionsCallbackInterface.OnInteract;
                @Interact.canceled -= m_Wrapper.m_NormalActionsCallbackInterface.OnInteract;
                @Horizontal.started -= m_Wrapper.m_NormalActionsCallbackInterface.OnHorizontal;
                @Horizontal.performed -= m_Wrapper.m_NormalActionsCallbackInterface.OnHorizontal;
                @Horizontal.canceled -= m_Wrapper.m_NormalActionsCallbackInterface.OnHorizontal;
                @MousePosition.started -= m_Wrapper.m_NormalActionsCallbackInterface.OnMousePosition;
                @MousePosition.performed -= m_Wrapper.m_NormalActionsCallbackInterface.OnMousePosition;
                @MousePosition.canceled -= m_Wrapper.m_NormalActionsCallbackInterface.OnMousePosition;
                @Run.started -= m_Wrapper.m_NormalActionsCallbackInterface.OnRun;
                @Run.performed -= m_Wrapper.m_NormalActionsCallbackInterface.OnRun;
                @Run.canceled -= m_Wrapper.m_NormalActionsCallbackInterface.OnRun;
                @Shoot.started -= m_Wrapper.m_NormalActionsCallbackInterface.OnShoot;
                @Shoot.performed -= m_Wrapper.m_NormalActionsCallbackInterface.OnShoot;
                @Shoot.canceled -= m_Wrapper.m_NormalActionsCallbackInterface.OnShoot;
            }
            m_Wrapper.m_NormalActionsCallbackInterface = instance;
            if (instance != null)
            {
                @Vertical.started += instance.OnVertical;
                @Vertical.performed += instance.OnVertical;
                @Vertical.canceled += instance.OnVertical;
                @Jump.started += instance.OnJump;
                @Jump.performed += instance.OnJump;
                @Jump.canceled += instance.OnJump;
                @Interact.started += instance.OnInteract;
                @Interact.performed += instance.OnInteract;
                @Interact.canceled += instance.OnInteract;
                @Horizontal.started += instance.OnHorizontal;
                @Horizontal.performed += instance.OnHorizontal;
                @Horizontal.canceled += instance.OnHorizontal;
                @MousePosition.started += instance.OnMousePosition;
                @MousePosition.performed += instance.OnMousePosition;
                @MousePosition.canceled += instance.OnMousePosition;
                @Run.started += instance.OnRun;
                @Run.performed += instance.OnRun;
                @Run.canceled += instance.OnRun;
                @Shoot.started += instance.OnShoot;
                @Shoot.performed += instance.OnShoot;
                @Shoot.canceled += instance.OnShoot;
            }
        }
    }
    public NormalActions @Normal => new NormalActions(this);
    public interface INormalActions
    {
        void OnVertical(InputAction.CallbackContext context);
        void OnJump(InputAction.CallbackContext context);
        void OnInteract(InputAction.CallbackContext context);
        void OnHorizontal(InputAction.CallbackContext context);
        void OnMousePosition(InputAction.CallbackContext context);
        void OnRun(InputAction.CallbackContext context);
        void OnShoot(InputAction.CallbackContext context);
    }
}
