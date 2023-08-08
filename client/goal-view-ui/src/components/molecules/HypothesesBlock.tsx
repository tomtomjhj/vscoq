import React, {FunctionComponent} from 'react';

import Hypothesis from '../atoms/Hypothesis';

import classes from './HypothesesBlock.module.css';
import { PpString } from '../../types';

type HypothesesBlockProps = {
    hypotheses: PpString[];
};

const hypothesesBlock: FunctionComponent<HypothesesBlockProps> = (props) => {

    const {hypotheses} = props;

    const hypothesesComponents = hypotheses.map((hyp, index) => {
        return <Hypothesis key={index} content={hyp} />;
    });

    return (
        <ul className={classes.Block}>
            {hypothesesComponents}
        </ul>
    );
};

export default hypothesesBlock;