using System;
using UnityEngine;

namespace Anchry.Dialogue
{
    public class DialougeEnum
    {
        public enum Attribute
        {
            Strength,
            Dexterety,
            Size,
            Constitution,
            Appearance, 
            MentalPower,
            Intelligence
        }; 

        public enum PlayerTrait
        {
            Herculean,
            Metaphysical, 
            Alacritous, 
            Perspicacious, 
            Circumspect, 
            Dipsomaniacal
        }

        public enum Crew
        {
            SavannahFitzgerald,
            PhilipPresho,
            MercuryEola,
            EugeneToeberg,
            ArlingtonSugarland,
            Lubbock,
        }

        public enum AnswerEnum
        {
            Need_FakeItem = 0, 
            Need_Item = 1,
            Need_Trait = 2, 
            Need_CrewMember = 3,
            Give_Item = 4,
            Give_FakeItem = 5 
        }


        public Attribute AllAttributes; 
        public PlayerTrait Traits; 
        public Crew CrewMembers;
        public AnswerEnum Answer;
        
    }
}
